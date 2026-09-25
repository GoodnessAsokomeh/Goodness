# I2V / R2V: Image and Reference-to-Video Evaluation

Keyword: **"i2v"**. Source: the I2V / R2V guideline page (16 screenshots supplied 2026-09-24) plus the four worked-example clips.
Sister file: `workada-vid.md` (the T2V tearsheet). The guide says read T2V first; everything there applies here too.

---

## Part 0: What this task is

Two task types, one workflow, one set of dimensions.

- **I2V (image-to-video).** The model generates a video starting from a reference image plus a text prompt. The reference is typically the first frame.
- **R2V (reference-to-video).** The model generates a video guided by one or more reference images that anchor identity and content. The reference is NOT necessarily the literal first frame.

You compare two responses (A and B) exactly like T2V, with the same core dimensions (Overall Preference, Instruction Following, Visual Quality, Motion and Temporal Quality, Audio Quality and Sync, Less AI Generated), **plus extra dimensions that check the output against the reference image(s)**:

1. Person ID Preservation
2. Content / Reference Preservation
3. Human-Created (R2V forms only)

---

## Part 0.5: Frame extraction, always at 0.1s (user instruction, 2026-09-25)

**Every clip (A, B, and any video reference) is extracted at one frame per 0.1s, i.e. 10 fps, before any judgment.** Never screen from a handful of sampled frames. Faces drift, objects vanish and counts change between coarse samples, so an absence or drift claim is only valid once the 0.1s frames have been checked.

```
ffprobe -v error -show_entries format=duration:stream=width,height,r_frame_rate -of compact a.mp4
mkdir -p frames/a frames/b
ffmpeg -v error -i a.mp4 -vf fps=10 -q:v 2 frames/a/%04d.jpg
ffmpeg -v error -i b.mp4 -vf fps=10 -q:v 2 frames/b/%04d.jpg
```

- Frame `NNNN.jpg` sits at **(NNNN − 1) × 0.1s**. Frame 0001 is 0.0s, 0051 is 5.0s, 0100 is 9.9s.
- Keep frames in the scratchpad, never in the repo.
- To review cheaply, tile them into contact sheets (one second per row) and zoom into native crops only where something looks off:
  `ffmpeg -v error -i a.mp4 -vf "fps=10,scale=320:-1,tile=10x5" -q:v 3 frames/a_sheet_%02d.jpg`
- Always open the first frame, the middle, and the **final second** at native size for Person ID and Content Preservation checks.
- The published rationale still follows the point-at-it test: say "near the end" or "as she turns", never frame numbers or timestamps to the tenth.

---

## Part 1: Overall Preference

- Works exactly like T2V. It is a gut call, scored **first**, and it is not an average or a count of the other dimensions.
- The preservation dimensions are scored **independently** and do not change how you pick Overall.
- The test: if your parents came across both videos, which one would they react to as better on gut feeling?

---

## Part 2: The extra dimensions

### 1. Person ID Preservation
- Are the people from the reference image still recognizable in the video?
- **Identity rides on the face.** Clothing and pose are separate (clothing goes to Content Preservation).
- A crisp, high-quality video can still alter someone's face and lose here.
- Check identity at **multiple points** in the clip, not just the first frame. Faces drift as the video plays.

### 2. Content / Reference Preservation
- Did everything the prompt did not target stay the same? Background, untouched objects, clothing, overall scene structure. Unrequested changes lose here.
- **STRONG** when core reference content is lost. A person missing, clothing swapped, environment changed, scene continuity broken.
- **SLIGHT** when there is only detail drift. A color shifts, a hairstyle changes, framing widens, a small accessory disappears.
- Heuristic: core loss goes STRONG, detail drift only goes SLIGHT.
- **Ties are OK on this dimension.** Untargeted regions are often near-identical in both responses.
- The page still links "How to Mark Severity" for sizing by counting. The newer severity page says counting no longer decides the call (see Part 5). Follow the newer rule.

### 3. Human-Created (R2V forms)
- Question on screen: *"Which one looks more like it could have been made by a human, real footage filmed by a videographer, or animation created by an artist?"*
- Same axis as Less AI Generated / Absence of AI Artifacts, phrased the positive way. The clip that looks more human-made is the one with fewer AI tells.
- **It is NOT asking whether the clip is animated.** Artist-made animation counts as human-made. A stylized or cartoon look is not an AI tell and never loses on this dimension by itself.
- How to judge depends on the prompt:
  - **Photorealistic prompts.** Judge like real footage. Natural lighting, realistic textures, plausible physics, no telltale AI artifacts.
  - **Stylized / animated prompts.** Judge whether it looks intentionally and skillfully made by an artist. Coherent style throughout, no mode-slips (photoreal skin in a cel-shaded scene, for example), no generator artifacts.
- Common tells that lose here:
  - plastic or waxy faces and skin
  - warped hands, limbs, or objects
  - over-smoothed textures
  - repeated patterns
  - impossible shadows or reflections
  - inconsistent perspective
  - random text-like artifacts
  - objects blending into each other

---

## Part 3: N/A rules and the reference frame

### When to use N/A
Some R2V forms offer N/A on the two preservation dimensions.
- **Person ID Preservation.** N/A only if no persons are present in the reference image OR the videos.
- **Content Preservation.** N/A only if there is no reference content other than personal identity to carry over.
- If the dimension applies at all, score it. **Never use N/A to dodge a close call.**

### The reference image is not always frame one
- In I2V the reference is typically the starting frame.
- In R2V the reference guides identity and content, but the video does not have to open on it. **Do not penalize a response for not literally starting from the reference.**
- Judge whether identity and untargeted content are preserved across the **whole clip**, checking multiple points including the final seconds.

### Watch out for
- Unrequested camera or framing shifts lower reference preservation.
- Accessories (earrings, logos) should carry over from the reference into the video.
- **No cross-dimension trade-offs.** A face drift in A does not offset an instruction failure in B.
- Check the last seconds of each video. Preservation failures often appear late as the scene evolves.

---

## Part 4: Worked examples

### Example 1: Person ID Preservation (grandma, football field)
**Reference image:** a woman with frizzy blonde hair pulled up loosely, gold PANTHERS #50 jersey, grey shorts, standing beside a red pylon on a lit field at night.

**Prompt:** Grandma jogs from the pylon down the sideline past the teenage players. Camera tracks alongside her. One of them tosses her a football; she catches it, sidesteps past him, jogs to midfield, spikes the ball into the turf, then flexes both biceps.

- Response A: https://5e0ef590-a08c-4ab0-95fd-03ef43da4b22.lovableproject.com/__l5e/assets-v1/a2c52ef4-e774-4212-baa2-e1adca33c7c5/i2v-grandma-response-a.mp4
- Response B: https://5e0ef590-a08c-4ab0-95fd-03ef43da4b22.lovableproject.com/__l5e/assets-v1/acd78a59-d836-475f-8d62-af23b561562c/i2v-grandma-response-b.mp4

**The official answer was not in the supplied screenshots.** What follows is my own read of the clips, checked on face crops at the start, middle and end. Treat it as unconfirmed until the guide's answer is seen.

- **A** (960x720, 10s) opens on the reference frame itself. The loose, frizzy updo with wisps carries through, and the face in the final flex stays weathered with the same round shape. Its players wear white jerseys.
- **B** (1280x720, 10s) opens at the pylon but already laughing from a new angle. Over the clip the hair tightens into a neat top bun, and in the final flex the face reads slimmer and smoother than the reference. Its players wear black jerseys.
- Lean: **A preserves identity better.** Vote strength is open until the official answer is known.
- Caveat: the reference face is small in the screenshot, so fine facial features cannot be compared from it. Hair shape and overall face shape are the parts that hold up.
- Off-dimension notes. A spikes the ball near the end zone with goalposts behind her, not at midfield (an Instruction Following point, not an ID point). B spikes on the 50-yard line.

### Example 2: Content / Reference Preservation (baseball fan)
**Reference image:** a young woman with a dark brown bob in a red and black LG Twins jacket with sleeve patches, filming on her phone from orange stadium seats, with a partly cloudy sky and blue patches overhead.

**Prompt:** She keeps the phone aimed at the field, jaw clenched as she watches the pitch play out on her screen. Her expression snaps from concentration to open-mouthed shock, then breaks into a wide grin as she pumps her free fist. A distant crowd roar builds from the stands. Cut to nearby fans in the orange seats leaping up with arms raised. Cut back to her lowering the phone and turning to face the field as ambient cheering fills the stadium.

- Response A: https://5e0ef590-a08c-4ab0-95fd-03ef43da4b22.lovableproject.com/__l5e/assets-v1/2ffb6792-1ca2-475e-b9cf-d5e0eacd5e72/i2v-baseball-response-a.mp4
- Response B: https://5e0ef590-a08c-4ab0-95fd-03ef43da4b22.lovableproject.com/__l5e/assets-v1/c3c5c4b6-2041-4f1c-8781-0a32d32dffb2/i2v-baseball-response-b.mp4

**Official answer: Response B is SLIGHTLY preferred.**
- In A, her hair picks up lighter streaks that the reference does not have. The reference shows a uniform darker hair color.
- A's sky reads noticeably more cloudy and overcast than the reference, which shifts the ambient lighting of the scene.
- B holds closer to the reference on both hair color and sky/lighting.
- Both are detail drifts (hair tone, cloud cover), not a loss of core reference content, so the vote is SLIGHT, not strong.

My frame check agrees. A's sky is flat grey across the clip while B keeps the brighter sky with blue patches. A (720x960) and B (1280x720) are both 10s. A cuts to fans in white and black shirts; B cuts to a crowd in TWINS jerseys and red caps.

**Lesson from this example:** a small hair-tone shift plus a sky change is enough to decide the dimension, and the size of the vote comes from whether the loss is core or detail.

---

## Part 5: The rating scale and vote strength

### The five-point scale
Used for Overall Preference and every dimension on T2V, I2V and R2V.
- **Strongly Prefer A.** A is clearly and significantly stronger.
- **Slightly Prefer A.** A has a noticeable but small edge.
- **Tie.** Truly equal. Rare.
- **Slightly Prefer B.** B has a noticeable but small edge.
- **Strongly Prefer B.** B is clearly and significantly stronger.

### Which vote strength? Two questions, no math
- **Step 1: did you have to think about it?** The winner was obvious on the first watch, Strongly. You weighed the two clips and landed on one side, Slightly.
- **Step 2: sanity-check it.** Imagine your mom or dad watched both clips once. They would point out the loser's problem unprompted, Strongly. They would only pick a winner if you asked them to choose, Slightly.
- Step 2 exists to catch the rater who thinks every call is obvious, or that none are.
- **Per dimension.** It is one test, not two. Apply the same instinct in spirit on every axis. Ask whether the gap on that specific axis jumped out on the first watch or needed deliberation. Do not literally imagine a casual viewer grading temporal consistency.

### Slightly vs Strongly
- **Slightly.** The two videos are broadly comparable and the call takes deliberation. You can name the deciding moment, but flipping the call would not feel crazy.
- **Strongly.** The winner is obvious on the first watch. Usually the loser has a jarring failure a casual viewer would flag at once, or you would not second-guess it and would not expect another rater to land differently.

### The most common mistake: under-calling
- Defaulting to Slightly "to be safe" is explicitly wrong. Vote strength tracks the **real gap**, not your confidence.
- Before settling on Slightly, ask whether you actually deliberated. If the winner was obvious on the first watch, it is Strongly.
- Same for ties. A Tie means that after watching both properly you **cannot name a single meaningful edge either way**. It does not mean both clips share the same flaws. Tying everything is almost never right. If you cannot find one meaningful edge, you did not watch carefully enough.

### Worked example: wolf pups
- Prompt: "Five wolf pups play in a clearing."
- Clip A: the count drifts from 5 to 6 mid-clip and two pups merge for several frames. Clip B: five distinct pups throughout, with one brief background flicker.
- **Motion and Temporal Quality: Strongly Prefer B.** Pups merging and the count changing mid-clip is a failure a casual viewer flags unprompted. No deliberation, and no other rater would land differently. B's brief flicker is only noticed when hunting for it, so it does not pull the call down to Slightly.

### Counting does not decide the call, but say what you saw
- Tallying flaws is no longer how you size a vote. Make the call on the deliberation test.
- The rationale still has to name the specific thing that separated the clips: what you compared, and what drove the decision.
- **Decide by deliberation, then say what you saw.**

---

## Part 6: Knowledge checks (answers confirmed on the page)

1. **Cel-shaded cartoon fox running through a forest.** A is coherent stylized animation (clean linework, consistent style, believable motion). B looks closer to photoreal, but the fox's paws warp mid-stride and background trees blend together. Human-Created? **Strongly Prefer A.** Wrong options offered: "Strongly Prefer B, it looks more like real footage" and "Tie, one is animated and one is realistic so they cannot be compared."
2. **Empty mountain cabin at dusk, no people in the reference or either video.** Person ID Preservation? **N/A.** No persons anywhere, so the dimension does not apply. Wrong options offered: Tie, Slightly prefer the better-quality video, Strongly Prefer A if its cabin looks more like the reference.

---

## Part 7: Deltas vs `workada-vid.md` (the T2V tearsheet)

- **Ties.** The T2V tearsheet says ties are more acceptable than in image eval. This guide says a Tie is rare and needs zero meaningful edge. The one exception is Content Preservation, where ties are OK because untargeted regions often match. Default to picking a side everywhere else.
- **Counting.** The T2V tearsheet says to count prompt matches for Instruction Following. This guide says counting no longer sizes a vote; the deliberation test does. Counting can still help you find the gap, but the size of the vote comes from the two-step test.
- **Identity drift.** The T2V tearsheet puts identity drift under Less AI Generated. On I2V/R2V, identity against the reference is its own dimension (Person ID Preservation, face only). Clothing, hair color, background and sky drift go to Content Preservation. No cross-dimension trade-offs.
- **Human-Created** is new and appears on R2V forms. Same axis as Less AI Generated, positive phrasing, and animation never loses by itself.
- Standing rules from the T2V line still apply: Final Preference and the four audio dimensions are always given, sample clips at 0.1s before any absence claim, and garbled text only counts as an AI tell when it is large in frame.

---

## Before You Submit (I2V / R2V additions)
- Did I score Overall first, on gut, before the preservation dimensions?
- Did I extract every clip at 0.1s (10 fps) before judging?
- Did I check the face at the start, middle AND final seconds of each clip?
- Did I keep clothing, hair color, background and sky out of Person ID and in Content Preservation?
- Did I use N/A only when no person (or no non-identity content) exists at all?
- On R2V, did I avoid penalizing a clip for not opening on the reference?
- Did I size each vote with the two-step deliberation test, and avoid a Slightly "to be safe"?
- Does each rationale name the specific thing that separated the clips?
