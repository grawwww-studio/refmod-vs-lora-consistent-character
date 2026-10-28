# Our third LoRA (the one that looked closest to the character), as shown in the video

These are the settings the video puts on screen next to our first LoRA. They are notes, not a script: we do not share our dataset, our LoRA or our configuration files.

| | First LoRA (`train.sh`, musubi-tuner) | Third LoRA (Fizgig) |
|---|---|---|
| Pictures | 19 stills, one-frame mode | 24 pictures + 18 short H3 clips of the same character |
| Helper | subject-reference teacher | image-training adapter (Circlestone Labs) |
| Rank | 16 | 16 |
| Learning rate | 3e-4 | Automagic (adaptive) |
| Length | 500 steps | 40 epochs, we used epoch 20 |
| Checkpoints | every 100 steps | every 5 epochs |
| Time | about 43 minutes of training (46 with loading and saving), rented 48 GB GPU | 43 minutes, rented H100 |

What we saw, by eye:
- The second LoRA (50 pictures, 3,000 steps, a third of the first learning rate) learned a type, not the face.
- Blind check: picked as the character in a blind look at the shuffled clips of one shot (two seeds).
- It came out glossy: wet-looking skin and beauty light. We switched to the checkpoint from halfway through training (epoch 20) and added a realism block to the prompt: matte skin, plain window light, a camera on a tripod. The skin looked matte by eye. We changed both at once, so we cannot say which one did it.
- We did not run it on two of the six test shots (P3 and P6), and the picture and RefMod arms were not tested on the LoRA's base model. One character: treat it as a hint.

Tools and credits:
- Fizgig (Apache-2.0): https://github.com/shootthesound/Fizgig
- The image-training adapter is by Circlestone Labs and sits under the MiniMax H3 Community License: https://huggingface.co/circlestone-labs/MiniMax-H3-Image-Training-Adapter
- The recipe came from a post by u/DeliciousGorilla on r/StableDiffusion.
- A LoRA trained this way is an H3 Model Derivative: read the H3 licence (territory, no redistribution without its terms) before you share one.
