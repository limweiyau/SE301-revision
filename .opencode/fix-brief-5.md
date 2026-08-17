COMPLETE VISUAL REDESIGN of the SE301 revision site (all files in this repo root). You are the ORCHESTRATOR (sol) — delegate page work to your @coding / @multistep luna subagents in parallel, integrate, verify. The user is unhappy with the current light theme, the code-block gradient, and the navbar (details-arrow + hamburger combo). This pass is MANDATORY and changes the whole look.

MODEL AFTER: a polished dark developer-docs site (Linear / Vercel / Stripe docs dark theme aesthetic). Before coding, fetch https://linear.app and https://vercel.com and study their dark surfaces, borders, and rhythm. Apply that restraint: dark canvas, 1px hairline borders, no color gradients, no heavy shadows, no glow.

MANDATORY DESIGN SYSTEM (replace assets/style.css entirely):

1. DARK THEME TOKENS (CSS custom properties):
   --bg: #0a0a0f;           /* page canvas */
   --surface: #121218;      /* cards, navbar */
   --surface-2: #17171f;    /* code block */
   --ink: #f4f5f7;          /* primary text */
   --muted: #9aa0ac;        /* secondary text */
   --line: rgba(255,255,255,0.09);   /* borders */
   --accent: #6b8afd;       /* links, active states */
   --accent-soft: rgba(107,138,253,0.14);
   --radius: 10px;
   --font: "Inter", ui-sans-serif, system-ui, -apple-system, "Segoe UI", sans-serif;
   --mono: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
   Body text #f4f5f7 on #0a0a0f. Anchor color var(--accent).

2. NAVBAR — single clean toggle, NO arrow, NO details element:
   - <header class="navbar"><div class="shell nav-inner">
     <a class="brand">SE301 <span>Revision</span></a>
     <button class="nav-toggle" aria-expanded="false" aria-controls="site-nav" aria-label="Menu">
       <svg hamburger icon, 20x20, 3 lines, stroke currentColor>  <!-- ONLY this icon, nothing else -->
     </button>
     <nav id="site-nav" class="nav-links"> 7 links (order: Plan, Aggregation, Composition, Singleton, Constructor, UML, Self-check) with hrefs plan.html, aggregation.html, composition.html, singleton.html, constructor-chaining.html, uml-reference.html, self-check.html </nav>
   </div></header>
   - Desktop (>=768px): button hidden; .nav-links inline row, right-aligned, gap 22px, links 14px/600 muted, hover -> ink, current page = accent color + 1px accent underline offset 6px.
   - Mobile (<768px): brand left, one 44x44 ghost button right with ONLY an SVG hamburger. .nav-links: hidden by default (display:none); when header has .open -> .nav-links becomes a dropdown panel: position absolute under the bar, left 50%, translateX(-50%), width min(calc(100vw - 32px), 400px), background var(--surface), 1px border var(--line), radius, padding 8px; links become full-width rows (12px padding, 16px font, radius 8px), current = accent-soft background.
   - Add a tiny inline <script> at the end of body (same on every page, ~10 lines): click on .nav-toggle toggles header.open + aria-expanded; Escape or click outside closes it. NO other JS on the page.
   - NO arrow characters, NO ::marker, NO disclosure symbols anywhere in the navbar.

3. CODE BLOCKS — dark, flat, zero gradients:
   - pre: background var(--surface-2), 1px border var(--line), radius 10px, NO box-shadow, NO inset gradient, NO fade. Remove the inset shadow entirely.
   - Font 13-14px mono, line-height 1.65, color #e6edf3, padding 18-22px, overflow-x: auto only.
   - Syntax tokens (GitHub-dark palette): .kw #ff7b72, .type #79c0ff, .str #a5d6ff. No bold trickery (keep font-weight normal except kw maybe 500).
   - .code-title bar: background var(--surface-2), border-bottom var(--line); title 14px/600; "Java" badge = 11px uppercase letterspaced muted text, no pill background.

4. CARDS, TABLES, LISTS, DETAILS: surface #121218, 1px var(--line) border, radius 10px, NO shadows (or only 0 1px 2px rgba(0,0,0,0.4), nothing bigger). Padding rhythm: 18-24px. Table rows: border-bottom var(--line), th = 12px uppercase muted, td = 14.5px. Study list items: border-bottom var(--line), number = accent mono. Details/summary self-check rows: same card styling; summary chevron via CSS ::after (see below) is fine ONLY on self-check items (a real affordance), rotated square chevron, accent color.

5. UML mini diagrams: stroke colors must be visible on dark: .uml-box stroke #d7dbe3 (light strokes), .uml-accent stroke var(--accent), .uml-caption fill var(--muted); filled diamond fill currentColor (light) works. Text in SVG uses fill currentColor -> ensure inherits light (#f4f5f7) or set explicit fill.

6. TYPOGRAPHY & RHYTHM: keep the clamp()-based fluid scale already in the file (it is good): section h2 clamp(1.6rem, 1.15rem + 2.2vw, 2.25rem), body 16px -> 17px at >=768px, .section-intro muted 15.5-17px. Section spacing 36-48px. Everything centered in .shell width min(920px, 100% - clamp(32px, 8vw, 64px)).

7. CONTENTS HUB (index.html): grid of 7 cards (1/2/3 cols at 560/768/1080), each card = link block: title 16-18px/650 + one muted description line. Hover: border-color accent. Card padding 18-22px.

8. SELF-CHECK: 5 details items; summary 16px/600; answers 15px muted; .answer-label accent/700.

APPLY UNIFORMLY to all 8 pages. Keep every content word, title, code sample, diagram markup, and anchor id EXACTLY as it is now — only presentation and the navbar markup change. The inline toggle script must be identical on every page (current-page class still marked on the matching nav link, aria-current="page").

YES THAT MEANS: replace the <details class="nav-toggle"> block on all 8 pages with the <button> version + nav, and append the inline script before </body> on all 8 pages.

VERIFICATION (run all, then report):
- html-validate all 8 pages: 0 errors.
- Headless Chromium (use PLAYWRIGHT_BROWSERS_PATH=/opt/data/.cache/ms-playwright and executablePath /opt/data/.cache/ms-playwright/chromium-1234/chrome-linux64/chrome, or npx playwright with browsers at that path) at 320, 390, 768, 1024, 1440: no console errors, no horizontal overflow, hamburger opens panel on <768 with 7 links visible, links all resolve 200.
- git diff --check clean.
- Screenshot index.html at 390px (mobile, after opening the menu) and at 1440px — save to /tmp/shots/opt-index-mobile.png and /tmp/shots/opt-index-desktop.png; screenshot aggregation.html at 390px full page to /tmp/shots/opt-agg-mobile.png.
- Report: files changed, the exact navbar HTML/JS used, and proof the screenshots exist.