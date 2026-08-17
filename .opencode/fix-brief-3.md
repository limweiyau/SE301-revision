Fix pass on the SE301 revision site (index.html in this repo root). You are the ORCHESTRATOR — delegate drafting/integration to your @coding / @multistep subagents, then verify. CHANGE ONLY the layout/packaging described below; keep all existing content and wording, the light theme, no-emoji rule, no-CDN rule, 16px minimum font, and the single self-contained index.html file.

GOAL: the page currently reads as one very long list and contains a huge 760px-wide UML diagram. Reorganize it into a COMPACT, card-based layout. Target: roughly half the current page height.

REQUIRED CHANGES:

1. CONTENTS PANEL (keep it — organize the page around it)
   - Directly under the header, add a compact "Contents" panel: one clean row of numbered anchor links covering EVERY section (Revision plan, Aggregation, Composition, Singleton, Java examples, UML reference, Self-check). It is the primary way to navigate; make it visually clear.

2. PACKAGE EACH CONCEPT IN A CARD (the core of this pass)
   - Replace the big standalone aggregation/composition diagram section with TWO compact concept cards side by side (2-col desktop, 1-col mobile):
     - Card "Aggregation": 2-3 line definition, a SMALL inline SVG mini-diagram (~260px max width, viewBox ~300x170) showing Library <> hollow diamond --- Book 1..*, plus the existing tiny Java example (books passed in) folded INTO the card as the last element.
     - Card "Composition": same structure — definition, small inline SVG mini-diagram (~260px) showing House <> filled diamond --- Room 1..*, plus the existing tiny Java example (rooms created in constructor).
   - The big 760x430 diagram is REMOVED. No diagram may exceed ~300px wide on this page.
   - Singleton becomes a third concept card (same grid): definition, small mini-UML (Singleton box + 2 clients), tiny Java example. Keep its existing wording and self-check question.
   - Constructor chaining (Grandparent/Parent/Child) stays, packaged as a fourth compact card in the same grid with its tiny code block.

3. COMPACT EVERYTHING ELSE
   - Revision plan: keep the 6 numbered items as ONE compact list (rows, small vertical rhythm, no cards, no boxes — extensible: adding item 7+ must be trivial).
   - UML reference: keep the 4 small glyph cards (they are already compact).
   - Self-check: keep all 5 questions in compact details rows (add the singleton one if missing).
   - Slash vertical spacing, header padding, section gaps (aim ~24-32px section rhythm), tighten CSS (remove unused rules), keep base font 16px.

4. Section order on the page: Contents → Revision plan → Concept cards (Aggregation, Composition, Singleton, Constructor chaining) → UML quick reference → Self-check. Update every anchor id and the jump nav to match.

VERIFICATION (you run these):
- html-validate: 0 errors; every href="#..." has a matching id; git diff --check clean.
- Headless Chromium at 360 / 768 / 1440 px: zero console errors, no horizontal overflow, minimum font size 16px.
- Report: final section list with ids, total page height reduction (approx lines), and which subagents you used.