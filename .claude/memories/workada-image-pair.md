# Workada — Text to Image Evaluation (Image A/B Pair Rating)

Consolidated handbook. Say **"Image Pair"** or **"Workada"** to resume this work. It is NOT Dynamo, NOT Claude Francais, NOT Sixth Sense, NOT Live S2S, NOT Ouija.

Sources, in order of authority:

1. **The Text to Image Evaluation Tearsheet** (received 2026-09-11), reproduced in full in Part 1 below. This is the current official document and it **supersedes** the older onboarding-course notes wherever the two disagree.
2. The onboarding course screenshots (captured 2026-08-22), which supply the artifact taxonomy and the worked justification examples the tearsheet does not repeat.
3. The user's own standing instructions from seven-plus graded tasks (character counts, output format, the point-at-it test). These are not in the tearsheet and remain in force.

Pod lead: **Angela Underwood** (Slack).

---

## Part 0 — The live format (user instruction, 2026-09-11). This overrides Parts 1 and 2.

**Six categories, always ranked, always in this order:**

1. **Overall Preference** — the gut call, made first, before the detailed analysis
2. **Correctness**
3. **Instruction Following**
4. **Visual Quality**
5. **Less AI Generated**
6. **Final Preference** — states which response is **slightly** or **strongly** better, **according to the ranking of the previous five categories**

**Always give a Final Preference.** It is never skipped and never left as a tie by default. It is the tally dimension: count how the five categories above fell, and let that count set both the side and the strength word. Slightly better when the count is close or turns on one category. Strongly better when one response takes most or all of them.

**Every justification is never more than 250 characters.** That is a hard ceiling on all six, Final Preference included. Verify the counts programmatically before publishing. Target roughly 200 to 250 so each one has room to do the full job.

**Every justification does four things, for both responses:**
- says why the winning response is better than the other
- names a real **strength** of Response A and a real **strength** of Response B
- names a real **flaw** in A and a real **flaw** in B
- points the same direction as the rating chosen

No justification praises one response only, and none critiques one response only. Both sides get credit and both sides get a mark against them.

**Note on category naming.** The tearsheet (Part 1) calls the naturalness dimension *AI-Generated Appearance / Naturalness* and orders Overall Preference as a tally scored last with no separate final call. The live screen instead shows **Less AI Generated** and carries **both** an Overall Preference at the top and a Final Preference at the bottom. Follow the live screen, which is what Part 1 itself instructs. Everything in Part 1's included / not-included columns still governs **what belongs in which category**; only the names, the order, and the count have changed.

---

## Part 1 — The Tearsheet (official, 2026-09-11)

### Overall Preference

**What's included**
- A tally of the other dimensions: count how many each image won
- Rate this last, after you have scored every other dimension
- If the count ties, break it with the dimensions that matter most for this prompt

**What's not included**
- Your gut feeling about which image looks better overall
- A fresh judgment made independently of the other scores

**Scale anchors**
- *Much better*: one image wins clearly on the tally, most or all dimensions
- *Slightly better*: one image wins the tally by a single dimension
- *Tie*: the dimensions split evenly and neither is ahead on the ones that matter most for this prompt

### Instruction Following

**What's included**
- Checkable items: subjects, objects, and actions
- Counts, quantities, and attributes: colors, materials, clothing, requested text
- Style, medium, and setting
- Negative constraints: "sun not visible", "no text"

**What's not included**
- Visual polish (scored under Visual Quality)
- Something that could not exist, when the prompt never asked (scored under Correctness)

**Scale anchors**
- *Much better*: one satisfies nearly all requirements, the other misses a major one
- *Slightly better*: one extra requirement right, or one small non-critical miss
- *Tie*: both honor the prompt to the same degree

### Visual Quality

**What's included**
- Sharpness and detail
- Lighting and color: consistent, not flat, muddy, or blown out
- Composition and framing, judged like a photograph
- Coherence: elements that fit, not pasted on

**What's not included**
- Prompt faithfulness (scored under Instruction Following)
- A soft or painterly look the prompt asked for, which is style rather than poor visual quality

**Scale anchors**
- *Much better*: clearly more polished across multiple craft elements
- *Slightly better*: both competent, one has a modest edge
- *Tie*: similar craft quality, no meaningful difference

### AI-Generated Appearance / Naturalness

**What's included**
- How real versus synthetic the image looks
- Judged against the requested style, not against photorealism
- Common tells: hands and fingers, teeth, eyes, cloned faces in crowds
- Impossible poses, melting edges, warped lines, garbled text

**What's not included**
- Style itself: watercolor, ink wash, and cartoon are meant to look soft
- A verifiable error such as misspelled text or a wrong count (scored under Correctness)

**Scale anchors**
- *Much better*: one convincingly clean for the style, the other has glaring tells
- *Slightly better*: both believable, one has fewer or subtler artifacts
- *Tie*: equally natural, or equally synthetic, for the style asked

### Correctness

**What's included**
- Text spelled correctly and rendered cleanly, including non-English
- Counts and quantities accurate
- Anatomy and physics: limbs, shadows, reflections
- Labels, flags, logos, and named facts

**What's not included**
- Whether the prompt asked for it (scored under Instruction Following)
- A synthetic look with nothing verifiably wrong (scored under AI-Generated Appearance)
- Craft quality (scored under Visual Quality)

**Scale anchors**
- *Much better*: one image's checkable facts are right, the other has a clear error
- *Slightly better*: one checkable detail right that the other gets wrong
- *Tie*: equally accurate on the facts you can verify

### More best practices

- **Zoom in.** Most artifacts hide at normal viewing size. Scan in a fixed order: hands, faces, text, repeated elements, background.
- **Style is not an artifact.** A watercolor, ink wash, or cartoon is supposed to look painterly or soft. Never flag "blurry" or "not photorealistic" as an AI tell when the prompt asked for a stylized medium.
- **Avoid ties when possible, but don't be afraid to score a tie when it is genuinely hard to separate.** One or two per task at most. If there is a prompt-critical difference, it is not a tie. Defaulting to "tie" or "equal" reads as low effort and will not pass.
- **Write it yourself.** Every justification is written fresh, in your own words, for the task in front of you. No copy-paste between dimensions or tasks, and no ChatGPT or other AI tools. Both are easy to spot and will be rejected.
- **Pace.** The recommended time depends on the number of dimensions and whether there is a comment box, but you should never spend more than **15 minutes per image task**.
- **Live tasks on multimango.com may change frequently and show different dimensions than this guide outlines.** Adapt to what is actually on screen, and reach out if you have questions or want guidance on new dimensions that appear.

### Before you submit

Run through this checklist every time.

- Did I read the full prompt before looking at either image?
- Did I look at each image on its own, zoomed in, before comparing them?
- Did I rate Overall Preference first, on gut feeling, before the detailed analysis?
- Did I score each dimension independently, rather than letting one call carry the rest?
- Did I avoid flagging a requested style as an artifact?
- Did I keep ties to one or two at most, with no tie where there is a prompt-critical difference?
- Did I write a specific justification, naming something in both images, for every explanation box that appeared?
- Did I check that each justification points the same direction as the rating I picked, and proofread it?

### Writing a justification

If an explanation box appears, you must write a justification, and **it is scored on how it is written as well as what it says**. A strong one names specific things in both images, explains why it matters by tying it to the prompt or a concrete flaw, and matches the rating you picked. Use full sentences, spell words correctly, and use plain vocabulary rather than fancy words you might misuse. **A correct verdict with poor writing can still fall short.**

**Weak, avoid this** — vague, restates the rating, or could apply to any task. For example, "A looks better" or "B feels more human."

**Strong, aim for this** — specific, points to something you can see, and names the dimension it affects. For example:

> "Chose B for Correctness: the storefront sign in A reads BAKERRY with a doubled letter, while B's signage is spelled correctly and rendered cleanly at full zoom."

---

## Part 2 — Conflicts to resolve, do not silently pick a side

These are places where the tearsheet contradicts itself or contradicts the older course material.

1. ~~**Overall Preference: tally-last, or gut-first?**~~ **RESOLVED 2026-09-11 by the user: the live screen has both.** Overall Preference is the gut call at the top, Final Preference is the tally at the bottom. See Part 0. Kept here for the record: The dimension table says it is a tally of the other dimensions, rated **last**, and explicitly excludes "your gut feeling" and "a fresh judgment made independently of the other scores." The Before You Submit checklist on the same sheet says "Did I rate Overall Preference **first**, on gut feeling, before the detailed analysis?" These cannot both be true. **Working assumption: follow the dimension table** (tally, scored last), because that is the normative section and the checklist line reads as carried over from the older two-preference format. If the live UI puts Overall Preference before the other dimensions, follow the UI and score it there as a gut call.

2. ~~**Five dimensions or six?**~~ **RESOLVED: six**, per Part 0. Kept here for the record: The tearsheet lists five: Overall Preference, Instruction Following, Visual Quality, AI-Generated Appearance / Naturalness, Correctness. The older course had six, splitting a gut "Overall Preference" up front from a "Final Preference After Detailed Review" at the end. The single tally-based Overall Preference appears to have absorbed both. **Adapt to what is actually on screen**, which the tearsheet itself instructs.

3. **Pace: 15 or 17 minutes?** The tearsheet caps at "never more than 15 minutes per image task." The older course note targeted 12 to 17 minutes. **Use 15 as the ceiling.**

4. **"Much better" or "strongly better"?** The tearsheet's anchors are worded *much better* and *slightly better*. The user's standing instruction is that every rating states STRONGLY or SLIGHTLY and never a bare "better". These agree on the part that matters: the strength word is always present. **Use whichever word the on-screen label uses**, and keep the strength word mandatory either way.

5. **Justification required only where a box appears.** The checklist says "for every explanation box that appeared." If a dimension ships without a box, no justification is needed for it.

---

## Part 3 — Standing user instructions, not in the tearsheet, still in force

### Output format
- **Output only the ratings and the justifications.** No checklist preamble, no findings write-up, no measurement tables, no "what separated them" section. Do the full analysis internally and publish only the ratings and the justification lines. Mention a caveat only if it would change which option to pick.
- **Never more than 250 characters, on all six categories** (user instruction, 2026-09-11). This replaces the earlier 100–150 / 150–200 split, which is dead. Target roughly 200 to 250. Verify the counts programmatically every time.
- **Each one carries why the winner is better, plus a strength and a flaw of both A and B.** See Part 0.
- **Every rating states STRONGLY or SLIGHTLY**, never a bare "better". Ties stay rare; when it truly is one, say "tie" outright rather than hedging.
- **Ratings and wording must agree.** Flip a dimension, flip its justification with it. "Strongly" needs a defect the eye catches at normal size; "slightly" is for a margin you had to look for.
- **Do not reuse the same evidence on two dimensions.** The tearsheet's "what's not included" columns are the map for this: Instruction Following owns whether the prompt asked for it, Correctness owns whether the depicted fact is true, AI-Generated Appearance owns whether it looks synthetic, Visual Quality owns craft. Where they converge on one defect, pick the single column that owns it and word the others differently.
- **The user retypes every justification, never pastes it.** The course bars copy-paste and AI-generated text.
- **Watch for sweeping.** Independent per-dimension judgment is visible to graders. Across seven tasks the winner alternated and A took at least one dimension in most of them.

### The point-at-it test (2026-08-28)

Before a justification ships, ask: **could a person looking at the image at normal size point to this and agree, with no tools?** If the claim only exists because I measured it, the measurement was right but the wording is wrong. Rewrite it as the thing the eye notices.

| Measured (keep private) | Published wording |
|---|---|
| wordmark bbox 213-847, 37px off centre | the wordmark sits right of centre in its bar, with more space on the left than the right |
| blank white band y818-1023, uniform 251.7 lum | a strip of empty white runs under the black bar to the bottom edge |
| text edge transition/white ratio 0.053 vs 0.084 | both wordmarks have clean, hard edges |
| ground high-frequency 35.6 vs 13.3 | the concrete grain is crisp in A and lost to shadow in B |

Never publish pixel counts, coordinates, luminance values, ratios, or percentages of the frame. Scale words are fine when they are honest and visible: *right of centre, the bottom fifth, flush to the edge, edge to edge, roughly a quarter of the frame*. The rule holds even when the number is what convinced me.

### The five-step loop

1. **Parse the prompt into a numbered checklist before looking at any image.** On edit tasks always add the implicit item: *everything not mentioned stays the same.* Unrequested edits are the single most common way an image loses Instruction Following.
2. **Download all three images (reference, A, B) and inspect at native resolution.** Screening at thumbnail size cannot support a claim about a detail.
3. **Measure anything a reviewer could challenge.** Do not eyeball color, brightness, or sharpness.
4. **Verify before asserting.** Two claims were withdrawn in one session after checking: a champagne label brand, and text that looked mirror-flipped but was only garbled. Both would have been indefensible.
5. **Write in the language of what the eye catches, not the language of the measurement.**

### Measurement toolkit

| Check | How | Where it mattered |
|---|---|---|
| Color fidelity | Mean RGB of a matched region | Cap color, snow tone, shirt brightness |
| Sharpness | Laplacian variance on **scale-matched** crops | Killed three false "A is sharper" claims |
| Illuminated sign glow | Halo brightness vs surrounding panel | "Keep the original lighting" requirement |
| Light direction | Left-half vs right-half face brightness | Proved a genuine relight, not a filter |
| Global vs local change | Subject shift compared against sky shift | Proved a shirt was re-rendered, not just exposed brighter |

Scale-matching the crops is the part people skip. A higher-resolution output will always win a raw sharpness read.

---

## Part 4 — Artifact taxonomy (onboarding course)

Hands and fingers (extra, missing, or fused digits, joints bending wrong). Faces, eyes, teeth (asymmetry, too many teeth, melted features). Duplicated people and objects (cloned faces or bodies in crowds and backgrounds). Garbled text (misspelled, warped, nonsense letters on signs). Melting and warping. Impossible physics (shadows, reflections, perspective, floating objects). Inconsistent details (a strap that changes sides, jewelry or patterns that shift across the frame). Background nonsense that only falls apart on zoom.

Scan order: **hands → faces → text → repeated elements → background**, zoomed in.

Note the split the tearsheet enforces. Misspelled or miscounted **text** belongs to **Correctness** when the error is verifiable, a real word rendered wrong. Nonsense lettering that just looks synthetic belongs to **AI-Generated Appearance**. The old memory filed all garbled text under artifacts, which would now double-count.

---

## Part 5 — Worked justification examples (onboarding course)

Every strong example shares the same shape: **verdict, the winner's specific evidence, then the loser's specific evidence, then why the gap matters.** Both images always appear.

Weak: "B is better, it looks more realistic and polished."

Strong: "B is slightly better - A's left hand has six fingers and the window reflection doesn't match her pose, while B keeps anatomy and lighting consistent."

Instruction Following, much better: "Image A clearly shows three witches with pointed hats having a picnic, along with the weeping willow and nearby bridge in a Monet-like style. Image B includes three women, a picnic, willow, and bridge, but they do not clearly appear to be witches, which misses a major requirement of the prompt."

Correctness, slightly better: "Image B presents the requested market, mall, waterfall, beach, lake, and mountain labels clearly and includes the Read, Write, and Speak controls. Image A includes the same core labels, but some of its Thai text appears less clean and more garbled, giving B a slight edge in correctness."

AI-Generated Appearance: "Image B shows more obvious AI artifacts because several people in the crowd look duplicated or unnaturally similar, and one person has an unrealistic body pose. Image A's crowd looks more varied and natural overall."

Visual Quality: "Image B has more natural lighting, richer detail, and a more polished restaurant-style composition, with the pasta and surrounding elements fitting together cohesively. Image A is clean and sharp, but its lighting is flatter and the composition feels simpler and less visually refined."

Avoid: vague lines that would fit any task ("A looks more polished", "B feels more human"). One-liners under roughly eight words. Reasons that never reference the image. Critiquing only one image and ignoring the other. Praising something that is actually a flaw.

---

## Part 6 — Recurring failure modes in the outputs being graded

Unrequested edits to things the prompt never mentioned (repainting furniture, deleting a chair, swapping a location). Claiming an edit that never happened, such as an iPod left untouched while a second phone was added beside it. Altering the exact subject the prompt said to protect. Inventing brand history that never existed. Both models leaving the identical artifact, which then separates nobody.

---

## Part 7 — Token cost

The acquisition and inspection economics live in the token-saver memory, `image-pair-token-workflow.md`: one chat per task, curl plus Pillow so the user never handles a file, tight native crops instead of repeated full frames, measure the continuous and look at the discrete, always diff on edit tasks.
