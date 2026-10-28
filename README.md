# RefMod vs LoRA vs a reference picture: one character in MiniMax H3

Workflows, prompts and training notes for the video "MiniMax H3 Consistent Character: RefMod (3 s) vs LoRA (46 min) vs Picture".

- Video: VIDEO_URL_SLOT

Everything we used to make the comparison, except the model weights, our character's LoRA files and its training pictures (not shared).
The character in the video, Lara, is fictional and AI-generated; no real person appears.

## What is here
| File | What it is |
|---|---|
| `workflows/api/01_refmod_extract.json` | Extract a RefMod from one character sheet (ComfyUI-MiniMaxH3Mod, "Full Reference", 1024 px). Took 3 s on an RTX 4090. |
| `workflows/api/02_ref2va_refmod_apply.json` | H3 Ref2VA with **no picture**: load the RefMod and apply it to the conditioning. |
| `workflows/api/03_ref2va_picture.json` | H3 Ref2VA with the character sheet as the only reference picture. |
| `workflows/api/04_fl2va_lora.json` | H3 FL2VA used as text-to-video, plus your LoRA (`LoraLoaderModelOnly`). Remove the LoRA node for the no-LoRA control. |
| `workflows/ui/` | The same graphs in ComfyUI's UI format. |
| `prompts.md` | The six test prompts in both formats, with what each clip had to show. |
| `training/` | `train.sh`, `dataset.toml` and an `items.example.jsonl` for an H3 identity LoRA with kohya-ss musubi-tuner (our first LoRA), and `v3-notes.md` with the settings of our third LoRA. |

You bring your own character sheet (`character_sheet.png` in the graphs is a placeholder), your own pictures and your own H3 files.

All graphs: 1152x640, 124 frames at 24 fps, 8 steps, euler/simple, sigma shift 12/3, the 8-step turbo LoRAs for each checkpoint
and, on the Ref2VA graphs, the `Ref2VAVSAGatePatch` node at sparsity 0.75 (a speed patch from
[ComfyUI-Ref2VA-VSA](https://github.com/Kablex/ComfyUI-Ref2VA-VSA); bypass it for dense attention). Model file names are the Comfy-Org repack names; download them yourself.

## Training notes (from the episode)
- Our first LoRA (`training/train.sh`: 19 pictures, 500 steps, learning rate 3e-4, one-frame mode, rank 16, about 43 minutes of training (46 with loading and saving) on a rented 48 GB GPU) barely changed the face against the same checkpoint without it.
- Two public H3 face LoRAs we inspected (training settings stored in the file headers) used about 3,300 and 3,400 steps at a third of our learning rate.
- musubi's docs call image-trained LoRAs on video "unvalidated territory".
- A second LoRA (50 pictures, 3,000 steps, a third of our learning rate) learned a type, not the face.
- The third LoRA was the one that looked closest to the character (picked in a blind look at one shot; see training/v3-notes.md).
- Always render the same prompt and seed with and without your LoRA before you build on it.

## Licences
- MiniMax H3: MiniMax H3 Community License. It covers the world except the EU, the UK, the US and South Korea; there you have to ask
  MiniMax for a licence. A LoRA for H3 is a Model Derivative: read the licence before you share one. Powered by MiniMax H3.
- ComfyUI-MiniMaxH3Mod: MIT. kohya-ss musubi-tuner: Apache-2.0 (some directories follow other licences; see its README). Fizgig: Apache-2.0.
- The JSON, shell and text files in this repository are MIT (see `LICENSE`). Third-party notices: `NOTICE.md`.

Not affiliated with MiniMax, kohya-ss, Fizgig, Circlestone Labs or the ComfyUI-MiniMaxH3Mod author.
