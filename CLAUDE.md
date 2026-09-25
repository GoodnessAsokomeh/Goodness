# Project memory

## Workada — Text to Image Evaluation (Image A/B Pair Rating)

The full handbook lives in `.claude/memories/workada-image-pair.md` and is imported below.
Trigger phrases: **"Image Pair"** or **"Workada"**.

Quick recall, the parts that are easiest to get wrong:

- **Six categories, always in this order:** Overall Preference, Correctness, Instruction
  Following, Visual Quality, Less AI Generated, Final Preference.
- **Overall Preference is the gut call at the top; Final Preference is the tally at the
  bottom**, and it always states **STRONGLY** or **SLIGHTLY** — never a bare "better",
  never skipped, never a default tie.
- **Every justification is ≤ 250 characters** (target ~200–250). Verify the counts
  programmatically before publishing.
- **Every justification names a strength AND a flaw in both A and B**, and points the same
  direction as the rating chosen.
- **Publish only the ratings and justifications.** No preamble, no findings write-up, no
  measurement tables.
- **The point-at-it test:** never publish pixel counts, coordinates, luminance values,
  ratios, or percentages of frame. Write what the eye notices at normal size.
- **Ceiling of 15 minutes per image task.** Keep ties to one or two at most.

## i2v — Image and Reference-to-Video Evaluation (I2V / R2V)

The full handbook lives in `.claude/memories/i2v.md` and is imported below.
Trigger word: **"i2v"**. When a message says "i2v", load that handbook and answer the
question or task it carries by its rules. It is NOT Workada image pair.

Quick recall, the parts that are easiest to get wrong:

- **Same core dimensions as T2V, plus the reference checks:** Person ID Preservation,
  Content / Reference Preservation, and Human-Created (R2V forms only).
- **Overall Preference is the gut call, scored first.** The preservation dimensions never
  change it.
- **Person ID is the face only.** Clothing, hair color, background and sky go to Content
  Preservation. Check the face at the start, middle and final seconds.
- **Content Preservation:** core loss is STRONG, detail drift is SLIGHT. Ties are OK here
  and nowhere else by default.
- **N/A only when the dimension cannot apply** (no person anywhere, or no non-identity
  content). Never to dodge a close call.
- **R2V clips need not open on the reference.** Never penalize that.
- **Size each vote by deliberation, not by counting.** Obvious on first watch is STRONGLY;
  never a SLIGHTLY "to be safe".
- **Human-Created:** artist-made animation counts as human-made. A stylized look never
  loses by itself.

## Toolchain

The inspection toolchain is python3, Pillow, curl, ffmpeg and tesseract. The web
container is ephemeral, so Pillow, ffmpeg and tesseract need reinstalling each session:

```
bash scripts/setup-toolchain.sh
```

It is idempotent and prints an OK/MISS line per tool.

@.claude/memories/workada-image-pair.md
@.claude/memories/i2v.md
