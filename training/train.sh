#!/bin/bash
# H3 identity LoRA with kohya-ss musubi-tuner, one-frame mode, subject-reference teacher (the recipe in musubi's docs/minimax_h3.md).
# Run on a Linux GPU box with 48 GB VRAM and 60 GB RAM (we used an L40S pod). Read the MiniMax H3 licence first.
# Needs: your pictures + items.jsonl (see items.example.jsonl), dataset.toml, and a Hugging Face token in HF_TOKEN.
set -e
cd /workspace
pip -q install uv
git clone https://github.com/kohya-ss/musubi-tuner.git && git -C musubi-tuner checkout f8a1b03794a49239a3539015075f5123d6c07d66
uv venv --python python3.11 venv
uv pip install --python venv/bin/python torch torchvision --index-url https://download.pytorch.org/whl/cu128
uv pip install --python venv/bin/python -e ./musubi-tuner
mkdir -p models/diffusion_models models/text_encoders models/vae
HF=https://huggingface.co/Comfy-Org/MiniMax-H3/resolve/main
for f in diffusion_models/minimax_h3_fl2va_pruned_int8_convrot.safetensors text_encoders/qwen3vl_32b_minimax_h3_int8_convrot.safetensors \
         vae/minimax_h3_video_vae_fp16.safetensors vae/minimax_h3_audio_vae_fp32.safetensors; do
  curl -L --fail -C - -H "Authorization: Bearer $HF_TOKEN" -o "models/$f" "$HF/$f"
done
cd musubi-tuner && export PATH=/workspace/venv/bin:$PATH
# 1. cache the pictures (each item carries OTHER pictures of the same person as references)
python src/musubi_tuner/minimax_h3_cache_latents.py --dataset_config /workspace/h3/dataset.toml --task ref2va --one_frame \
  --video_vae /workspace/models/vae/minimax_h3_video_vae_fp16.safetensors --audio_vae /workspace/models/vae/minimax_h3_audio_vae_fp32.safetensors --cache_seed 42 --skip_existing
# 2. cache the captions (text-only student, subject-reference teacher)
python src/musubi_tuner/minimax_h3_cache_text_encoder_outputs.py --dataset_config /workspace/h3/dataset.toml --task t2va --one_frame --teacher_conditions subject_ref \
  --text_encoder /workspace/models/text_encoders/qwen3vl_32b_minimax_h3_int8_convrot.safetensors --text_cache_dtype bf16 --text_encoder_blocks_to_swap 50 --skip_existing
# 3. train. These are the settings of our quick run (500 steps, LR 3e-4): it barely moved the face in our test. See README for what to change.
accelerate launch --num_cpu_threads_per_process 1 --mixed_precision bf16 src/musubi_tuner/minimax_h3_train_network.py \
  --dataset_config /workspace/h3/dataset.toml --task t2va --one_frame --video_only \
  --dit /workspace/models/diffusion_models/minimax_h3_fl2va_pruned_int8_convrot.safetensors \
  --network_dim 16 --network_alpha 16 --sdpa --mixed_precision bf16 --gradient_checkpointing --blocks_to_swap 48 --block_swap_h2d_only --optimizer_type adamw8bit \
  --h3_teacher_matching --h3_teacher_conditions subject_ref --h3_teacher_condition_sigma_min 0.15 --h3_teacher_loss_mag_weight 0.5 --h3_teacher_loss_dc_weight 0.3 \
  --learning_rate 3e-4 --lr_scheduler constant_with_warmup --lr_warmup_steps 50 --max_train_steps 500 --save_every_n_steps 100 \
  --seed 42 --max_data_loader_n_workers 2 --persistent_data_loader_workers --output_dir /workspace/output/mychar --output_name mychar
