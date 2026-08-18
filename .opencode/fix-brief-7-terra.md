Polish pass on the SE301 revision site (repo root /workspace/SE301-revision). You are the builder (gpt-5.6-terra). The user switched to GPT because the current build quality is not acceptable. Improve the site to a genuinely professional Linear/Stripe-dark level. Work DIRECTLY on the 4 files: index.html, generics.html, uml.html, patterns.html and assets/site.css.

HARD CONSTRAINTS — do NOT break these (they are currently correct and the user has been fighting about them for hours):
- Dark theme (#0a0a0f). Pico v2 base + assets/site.css. Do not add new build tooling.
- Navbar: sticky translucent blur bar, single hamburger button at ALL screen sizes (ids nav-toggle/nav-links, header.navbar.open contract, inline script at body end stays). Never expose inline links.
- Code blocks: white-space pre-wrap, NO horizontal scroll ever, font already clamp(10.5px, 0.8vw + 0.35rem, 13px) — keep or make smaller, never bigger. Keep code line examples short, NO blank lines inside code.
- ZERO dead space below the last element of each article card (already ~3px — keep it that tight; do not re-add bottom padding/margins).
- Keep every heading, sentence, code sample and diagram EXACTLY as-is otherwise.

WHAT TO IMPROVE:
1. Vertical rhythm & structure of all pages: consistent spacing between headings, paragraphs, code, diagrams (aim 8-20px, never larger). Make the generics page read as a clean sequence of rules. Tighten the landing page hero.
2. Typography: refine the scale (h1/h2/body) with clamp() so it looks designed, not default. Tune line-height/letter-spacing.
3. Cards (Pico article): consistent padding, radius, subtle border — uniform on all pages.
4. UML page: align the glyph cards evenly, keep diagrams centered and 100%-scalable, no clipping at 320px.
5. Hover/focus states on links and the hamburger — subtle, keyboard-friendly.
6. Everything responsive 320-1440 without horizontal overflow.

Then VERIFY (mandatory, use your own tooling e.g. the local playwright/Chromium like before): html-validate all 4 pages; Chromium at 320/640/1440px on all 4 pages — zero console errors, zero horizontal overflow, hamburger opens/closes with all links visible, all internal links resolve. Screenshot /tmp/shots/terra2-generics.png (640px) and /tmp/shots/terra2-index.png (1440px) for the record.

Report: exact CSS/structure changes you made and the verification results. Do not add any content.