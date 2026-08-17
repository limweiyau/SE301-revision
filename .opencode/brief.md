Build a single-page static revision website for SE301 (software engineering / OOP). Working directory is the repo root (/workspace/SE301-revision). You are the ORCHESTRATOR: delegate the content drafting and the SVG diagram work to your subagents (the @coding / @multistep agents) so they run in parallel, then review and integrate their output into the final page. Do not write all the content yourself.

DELIVERABLE
- One self-contained index.html (inline CSS + tiny inline JS, no external CDNs, no frameworks, no build step). Split into an assets/ dir ONLY if it is clearly cleaner.
- README.md (3 lines max: what it is, how to serve locally, the public URL placeholder).
- Valid HTML, zero console errors, `git diff --check` clean.

STYLE
- Light clean theme: page bg #f6f7f9, cards #ffffff, text #1c2530, muted #5b6779, accent #2f6fed. Soft 1px borders, gentle shadows.
- No emojis anywhere. Inline SVG icons only.
- Mobile-first (320-1200px), base font >= 16px, short sentences.
- UNDERSTANDABILITY OVER VERBOSITY. No walls of text: every concept = 1-2 short sentences. Diagrams are the star of this page.

CONTENT (tightly scoped — do not add extra topics)
1. Header: "SE301 Revision — OOP Principles & UML".
2. Revision plan (short): 5 focus areas, each = "know this" (one line) + "test yourself" (one line): objects vs classes, encapsulation, inheritance, polymorphism, aggregation vs composition.
3. CORE SECTION — Aggregation vs Composition:
   - 2-line plain-language definition of each (both are "has-a" whole-part relationships).
   - Aggregation: parts can exist independently, can outlive the whole, parts may be shared. UML = hollow diamond on the whole side.
   - Composition: parts cannot exist without the whole; the whole owns the parts' lifetimes (delete whole -> delete parts). UML = filled diamond.
   - One side-by-side comparison table, 5 rows max.
   - One inline SVG UML class diagram showing BOTH: Library <>(hollow)---- Book 1..* (aggregation) and House <>(filled)---- Room 1..* (composition). Clean, hand-drawn SVG, readable labels, no libraries.
4. Tiny code examples (Java, ~10 lines each, correctly formatted, syntax-highlighted if easy inline):
   - Aggregation: Library holds a List<Book> passed in from outside.
   - Composition: House creates its Rooms in its constructor (new Room(...)).
5. UML quick reference: 4 relationship types with one-line meaning + a minimal inline SVG glyph each: association (plain line), aggregation (hollow diamond), composition (filled diamond), inheritance (open triangle). Plus multiplicities (1, 1..*, 0..*) as one short line each.
6. Self-check: 4 short questions, click-to-reveal one-line answers.

VERIFICATION
- After writing: `node --check` any JS you extract (or note it is inline), confirm every id referenced exists, run `git diff --check`.
- Report: files changed, what each section covers, and the exact subagents you delegated to.