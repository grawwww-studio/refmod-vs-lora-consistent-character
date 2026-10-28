# The six test prompts
Same scene, camera, outfit and action text in every arm; only the identity method and the prompt format differ. Seeds 4103, 5207, 6311. 1152x640, 124 frames (5.17 s) at 24 fps, 8 steps, euler/simple, sigma shift video 12 / audio 3.
- **Picture** and **RefMod** use the structured Ref2VA prompt (`<Picture 1>` = the character sheet; with RefMod no picture is loaded and the RefMod is applied to the conditioning).
- **LoRA** and **no LoRA** use the caption-style prompt on the FL2VA checkpoint, trigger word first (here `mytrigger`).

## P1: framing: medium close-up, talking head
What must be true in the clip: medium close-up chest-up framing; white hoodie; she faces the lens and speaks (mouth moves, nods)

Picture / RefMod (Ref2VA, structured):
```
subject_definitions:
<Subject 1> is the adult woman shown on <Picture 1>, a character sheet of one woman (front, side, back and face close-up, same person, plain grey backdrop). Her face, facial proportions, freckles and hairstyle come from the face close-up and the other views. Copy none of the grey backdrop, panel layout, lighting, framing or clothing of the sheet, and never show the sheet itself. Facial identity details: a young woman with a straight black shoulder-length bob with a centre parting.
detailed_description:
Camera: medium close-up from the chest up, 50mm lens, locked-off at eye level, centred.
Setting and lighting: a bright studio with an off-white wall and a wooden shelf behind her, soft window light from camera right.
Texture: visible skin pores, natural sheen, a fine film grain.
[Shot 1] <Subject 1> wears a white oversized cotton hoodie with the hood down. She talks calmly to the camera, with small head movements and expressive eyebrows, and gives a small nod and a slight smile at the end. No on-screen text, no speech.
overall_soundscape:
quiet natural room tone.
non_diegetic_music:
N/A
```
LoRA / no LoRA (FL2VA, caption style):
```
mytrigger, medium close-up from the chest up, 50mm lens, locked-off at eye level, centred, in a bright studio with an off-white wall and a wooden shelf behind her, soft window light from camera right, a young woman with a straight black shoulder-length bob with a centre parting, wearing a white oversized cotton hoodie with the hood down, she talks calmly to the camera, with small head movements and expressive eyebrows, and gives a small nod and a slight smile at the end, visible skin pores, natural sheen, fine film grain. Sound: none, no speech.
```

## P2: pose: full body in motion
What must be true in the clip: head-to-feet visible; denim jacket over white tee; walking toward camera outdoors in warm low light

Picture / RefMod (Ref2VA, structured):
```
subject_definitions:
<Subject 1> is the adult woman shown on <Picture 1>, a character sheet of one woman (front, side, back and face close-up, same person, plain grey backdrop). Her face, facial proportions, freckles and hairstyle come from the face close-up and the other views. Copy none of the grey backdrop, panel layout, lighting, framing or clothing of the sheet, and never show the sheet itself. Facial identity details: a young woman with a straight black shoulder-length bob with a centre parting.
detailed_description:
Camera: full-body wide shot, 35mm lens at chest height, camera slowly walking backwards in front of her.
Setting and lighting: a city street at golden hour, blurred buildings and passers-by behind her, warm low sun from camera left.
Texture: visible skin pores, natural sheen, a fine film grain.
[Shot 1] <Subject 1> wears a black denim jacket over a plain white t-shirt, dark jeans and white trainers. She walks toward the camera at a relaxed pace, head to feet in frame the whole time, swinging her arms naturally. No on-screen text, no speech.
overall_soundscape:
quiet natural room tone.
non_diegetic_music:
N/A
```
LoRA / no LoRA (FL2VA, caption style):
```
mytrigger, full-body wide shot, 35mm lens at chest height, camera slowly walking backwards in front of her, in a city street at golden hour, blurred buildings and passers-by behind her, warm low sun from camera left, a young woman with a straight black shoulder-length bob with a centre parting, wearing a black denim jacket over a plain white t-shirt, dark jeans and white trainers, she walks toward the camera at a relaxed pace, head to feet in frame the whole time, swinging her arms naturally, visible skin pores, natural sheen, fine film grain. Sound: none, no speech.
```

## P3: lighting: dim room, monitor glow
What must be true in the clip: close-up; dim scene lit mainly by cool screen light plus warm lamp; charcoal sweater; looks up to lens at the end

Picture / RefMod (Ref2VA, structured):
```
subject_definitions:
<Subject 1> is the adult woman shown on <Picture 1>, a character sheet of one woman (front, side, back and face close-up, same person, plain grey backdrop). Her face, facial proportions, freckles and hairstyle come from the face close-up and the other views. Copy none of the grey backdrop, panel layout, lighting, framing or clothing of the sheet, and never show the sheet itself. Facial identity details: a young woman with a straight black shoulder-length bob with a centre parting.
detailed_description:
Camera: close-up of face and shoulders, 85mm lens at f/1.8, static, slightly low handheld sway.
Setting and lighting: a dim home office lit only by a cool monitor glow from the front and one warm lamp behind her, blurred bookshelves.
Texture: visible skin pores, natural sheen, a fine film grain.
[Shot 1] <Subject 1> wears a charcoal crew-neck sweater. She reads the screen in front of her, eyes moving, then looks up into the lens and raises her eyebrows with a small smile. No on-screen text, no speech.
overall_soundscape:
quiet natural room tone.
non_diegetic_music:
N/A
```
LoRA / no LoRA (FL2VA, caption style):
```
mytrigger, close-up of face and shoulders, 85mm lens at f/1.8, static, slightly low handheld sway, in a dim home office lit only by a cool monitor glow from the front and one warm lamp behind her, blurred bookshelves, a young woman with a straight black shoulder-length bob with a centre parting, wearing a charcoal crew-neck sweater, she reads the screen in front of her, eyes moving, then looks up into the lens and raises her eyebrows with a small smile, visible skin pores, natural sheen, fine film grain. Sound: none, no speech.
```

## P4: action: pouring and drinking coffee
What must be true in the clip: waist-up in a bright kitchen; yellow cardigan; pours coffee into a mug AND sips from it

Picture / RefMod (Ref2VA, structured):
```
subject_definitions:
<Subject 1> is the adult woman shown on <Picture 1>, a character sheet of one woman (front, side, back and face close-up, same person, plain grey backdrop). Her face, facial proportions, freckles and hairstyle come from the face close-up and the other views. Copy none of the grey backdrop, panel layout, lighting, framing or clothing of the sheet, and never show the sheet itself. Facial identity details: a young woman with a straight black shoulder-length bob with a centre parting.
detailed_description:
Camera: medium shot from the waist up, 35mm lens, handheld with a slight natural sway.
Setting and lighting: a bright kitchen with white tiles and a window behind her, soft backlight, steam rising from the mug.
Texture: visible skin pores, natural sheen, a fine film grain.
[Shot 1] <Subject 1> wears a mustard yellow knit cardigan over a white tee. She pours coffee from a glass pot into a ceramic mug on the counter, picks up the mug, blows on it, takes a sip and smiles. No on-screen text, no speech.
overall_soundscape:
quiet natural room tone.
non_diegetic_music:
N/A
```
LoRA / no LoRA (FL2VA, caption style):
```
mytrigger, medium shot from the waist up, 35mm lens, handheld with a slight natural sway, in a bright kitchen with white tiles and a window behind her, soft backlight, steam rising from the mug, a young woman with a straight black shoulder-length bob with a centre parting, wearing a mustard yellow knit cardigan over a white tee, she pours coffee from a glass pot into a ceramic mug on the counter, picks up the mug, blows on it, takes a sip and smiles, visible skin pores, natural sheen, fine film grain. Sound: none, no speech.
```

## P5: hard: true profile view
What must be true in the clip: side/profile view for most of the clip; train window with passing scenery; cream knit; slow head turn at the end

Picture / RefMod (Ref2VA, structured):
```
subject_definitions:
<Subject 1> is the adult woman shown on <Picture 1>, a character sheet of one woman (front, side, back and face close-up, same person, plain grey backdrop). Her face, facial proportions, freckles and hairstyle come from the face close-up and the other views. Copy none of the grey backdrop, panel layout, lighting, framing or clothing of the sheet, and never show the sheet itself. Facial identity details: a young woman with a straight black shoulder-length bob with a centre parting.
detailed_description:
Camera: medium close-up from the side, 85mm lens, locked-off, her head in exact profile (90 degrees to the camera) for the whole shot.
Setting and lighting: a train window seat, countryside passing blurred outside, soft overcast daylight.
Texture: visible skin pores, natural sheen, a fine film grain.
[Shot 1] <Subject 1> wears a cream cable-knit sweater. She looks out of the window in profile, then slowly turns her head halfway towards the lens at the end. No on-screen text, no speech.
overall_soundscape:
quiet natural room tone.
non_diegetic_music:
N/A
```
LoRA / no LoRA (FL2VA, caption style):
```
mytrigger, medium close-up from the side, 85mm lens, locked-off, her head in exact profile (90 degrees to the camera) for the whole shot, in a train window seat, countryside passing blurred outside, soft overcast daylight, a young woman with a straight black shoulder-length bob with a centre parting, wearing a cream cable-knit sweater, she looks out of the window in profile, then slowly turns her head halfway towards the lens at the end, visible skin pores, natural sheen, fine film grain. Sound: none, no speech.
```

## P6: hard: hands near face
What must be true in the clip: close-up three-quarter angle outdoors; navy shirt; hand tucks hair AND hand covers mouth while laughing, hand has plausible fingers

Picture / RefMod (Ref2VA, structured):
```
subject_definitions:
<Subject 1> is the adult woman shown on <Picture 1>, a character sheet of one woman (front, side, back and face close-up, same person, plain grey backdrop). Her face, facial proportions, freckles and hairstyle come from the face close-up and the other views. Copy none of the grey backdrop, panel layout, lighting, framing or clothing of the sheet, and never show the sheet itself. Facial identity details: a young woman with a straight black shoulder-length bob with a centre parting.
detailed_description:
Camera: close-up of head and shoulders, 50mm lens, handheld, three-quarter angle.
Setting and lighting: a park on an overcast day, soft flat light, blurred green trees behind her.
Texture: visible skin pores, natural sheen, a fine film grain.
[Shot 1] <Subject 1> wears a navy linen shirt. She tucks a lock of hair behind her ear with her right hand, then covers her mouth with her hand while laughing, then lowers it. No on-screen text, no speech.
overall_soundscape:
quiet natural room tone.
non_diegetic_music:
N/A
```
LoRA / no LoRA (FL2VA, caption style):
```
mytrigger, close-up of head and shoulders, 50mm lens, handheld, three-quarter angle, in a park on an overcast day, soft flat light, blurred green trees behind her, a young woman with a straight black shoulder-length bob with a centre parting, wearing a navy linen shirt, she tucks a lock of hair behind her ear with her right hand, then covers her mouth with her hand while laughing, then lowers it, visible skin pores, natural sheen, fine film grain. Sound: none, no speech.
```
