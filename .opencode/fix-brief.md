Fix pass on the SE301 revision site (index.html in this repo root). You are the ORCHESTRATOR — delegate drafting to your @coding / @multistep subagents where useful, then integrate. CHANGE ONLY the items below; keep all existing content, wording, color palette, light theme, no-emoji rule, no-CDN rule, and the single self-contained index.html structure. Do not add topics beyond Singleton.

CHANGES (all three required):

1. ADD SINGLETON
   - Revision plan section ("Five ideas to know"): becomes SIX ideas. Add a 6th item: Singleton — Know this: "A class that guarantees exactly one instance, reached through a static getInstance()." Test yourself: "Why can you not use new? How do you get the instance?"
   - New compact section between the aggregation/composition section and the Java examples section: "Singleton — one instance only". Content: one short intro sentence (what problem it solves), a small inline SVG UML class diagram (Singleton class box with -instance, + getInstance(), min 3 class boxes showing Client -> Singleton with a note "returns same instance"), and a tiny Java example (~8 lines: private constructor + private static final INSTANCE + static getInstance; public class Singleton). Keep the same diagram style as the existing ones.
   - Add one self-check question: "How do you obtain the singleton instance?" — Answer: "Through getInstance(); the constructor is private."

2. READABILITY PASS (this is why the page feels hard to read)
   - Base font: 17px (>=16px everywhere, no font-size under 15px anywhere).
   - line-height ~1.7 for body text; ensure text contrast >= WCAG AA (muted text darker, e.g. #4a5568 instead of #5b6779 if needed).
   - Constrain text measure: content columns max-width ~70ch; sections get comfortable vertical rhythm (section spacing ~64-80px).
   - Stronger heading hierarchy: larger h2, clearer section numbers, more whitespace between heading and content.
   - Keep the jump-links nav at top; it must still match all section ids.

3. REPLACE THE "IDEA CARDS" SECTION LAYOUT (user dislikes the card grid)
   - Remove the plan-card grid entirely. Replace with a numbered study list: one vertical list, each item = a row with a large number (01-06), the concept name as a heading, and "Know this" / "Test yourself" as two short labelled lines below it. Plain rows with bottom borders, NOT cards, no boxes, no shadows. Full-width, single column, easy to scan top-to-bottom.

VERIFICATION
- html-validate must pass (0 errors); all anchor/id pairs intact (ids referenced by jump links must exist); git diff --check clean; open the result in a headless browser and confirm zero console errors and no horizontal overflow.
- Report: files changed, the new section flow order, and which subagents you delegated to.