Restructure the SE301 revision site in this repo root from a single long page into a multi-page static site — one page per concept, cleanly isolated, sharing one stylesheet. You are the ORCHESTRATOR — delegate the per-page drafting to your @coding / @multistep subagents in parallel, integrate, then verify. Keep: light theme, no-emoji rule, no-CDN rule, 16px minimum font, compact rhythm (~24-32px sections), all existing content and wording.

PAGE LAYOUT (all static HTML, relative links, in repo root):

1. index.html — HOME / CONTENTS hub (compact):
   - Header: "SE301 Revision — OOP Principles & UML" + one-line subtitle.
   - Contents grid: 7 compact cards, each linking to a page: Revision plan, Aggregation, Composition, Singleton, Constructor chaining, UML reference, Self-check. Each card = title + one-line description. Grid 2-up desktop, 1-col mobile. This page must stay SHORT (no content duplication — it is a launcher).

2. plan.html — the 6-item numbered revision list (existing content, compact).

3. aggregation.html — the Aggregation concept card: definition (2-3 lines), mini UML diagram (existing 300x170 SVG), tiny Java example, 2-line code note.

4. composition.html — same structure for Composition (its own 300x170 SVG + Java example).

5. singleton.html — same structure for Singleton (mini UML + Java example + its self-check question inline).

6. constructor-chaining.html — Grandparent/Parent/Child example with implicit default constructor + super() notes (existing content).

7. uml-reference.html — the 4 relationship glyph cards (association, aggregation, composition, inheritance) + the multiplicity strip (1, 1..*, 0..*).

8. self-check.html — all 5 click-to-reveal questions (existing wording).

SHARED STRUCTURE (identical on every page):
- One shared stylesheet: move ALL CSS from index.html into assets/style.css and link it from every page. Keep it the same design system (colors, card style, code block style, study-list style).
- Every page gets the same header nav: site title (links to index.html) + a compact horizontal nav (Plan · Aggregation · Composition · Singleton · Constructor chain · UML · Self-check) with the current page's link marked (class="current").
- Every page keeps a small footer (same one line as today).

VERIFICATION (required):
- html-validate each of the 8 pages: 0 errors.
- Crawl all internal links (each href target exists as a file; each page has no broken anchors).
- Headless Chromium on index, aggregation, singleton: zero console errors, no horizontal overflow, min font 16px, at 360 and 1440px.
- git diff --check clean (delete unused CSS leftovers from the old single page).
- Report: file list with line counts, subagents used, and any content you had to move vs. rewrite.