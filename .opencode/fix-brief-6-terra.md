URGENT DESIGN FIX for the SE301 revision site (repo root). You are the lead designer/builder now. The user is angry: the LANDING PAGE and the NAVBAR look ugly. Your job: make them look genuinely professional, benchmark = Stripe/Linear/Vercel docs dark aesthetic. Do NOT touch content/wording; do not break functionality.

LOOK AT THE ATTACHED SCREENSHOTS FIRST (/tmp/shots/nav-mobile.png, /tmp/shots/nav-desktop.png, /tmp/shots/agg-mobile.png, /tmp/shots/uml-mobile.png) — they show the current state you must improve.

WHAT TO REDESIGN (everything else stays identical):
1. NAVBAR (shared header on all 6 pages: index.html, aggregation.html, composition.html, singleton.html, constructor-chaining.html, uml.html):
   - Current: plain bar + raw hamburger; looks flat/cheap. Make it polished: subtle backdrop blur + translucency (background: rgba(10,10,15,0.8); backdrop-filter: blur(12px)), hairline bottom border, refined brand lockup (clean wordmark, small accent dot or lighter weight — tasteful, not gimmicky), and a proper hamburger button: 42px ghost button, 2px rounded strokes, hover/focus ring, aria-expanded maintained. Dropdown panel: same blur surface, generous padding, roomy rows, accent current-page state, smooth 160ms fade/slide-in (transform + opacity, respecting prefers-reduced-motion).
   - The hamburger must work on ALL screen sizes and never expose links inline. Keep the existing id="nav-toggle" / id="nav-links" / header.navbar.open contract and the existing inline script on each page — just restyle + polish.

2. LANDING PAGE (index.html):
   - Current: small heading + tiny link list; reads as an afterthought. Redesign into a proper hero landing: vertically balanced hero block (py 3-4rem), large clean H1 (clamp ~2.6-3.2rem, tight letterspacing -0.03em), one muted tagline under it, then the 5 topics as a REFINED LIST: roomy rows with subtle dividers (or clean underline links, accent chevron on hover — no emoji), generous line-height, 17-18px links. Optionally: a faint radial glow behind the hero (one very subtle radial-gradient on a pseudo-element, low alpha) — tasteful only. It must look intentional and balanced, not empty and not loud.
   - Keep the same headings/wording and link targets. Mobile-first; must be flawless at 320px and 1440px.

3. CONSISTENCY: apply the SAME header treatment to all 6 pages; all pages keep dark theme (#0a0a0f-family), current CSS files live in assets/site.css (Pico v2 dark is the base; you may add/override or replace with a clean minimal custom stylesheet file if that yields a better result — but the site must stay dark, responsive, and the code blocks must keep wrapping with NO horizontal scroll).

VERIFICATION (run all, then report): html-validate all 6 pages; headless Chromium (PLAYWRIGHT_BROWSERS_PATH=/opt/data/.cache/ms-playwright, executablePath /opt/data/.cache/ms-playwright/chromium-1234/chrome-linux64/chrome) at 320/768/1440: no console errors, no horizontal overflow, hamburger opens/closes, all nav links visible when open; screenshots: /tmp/shots/terra-index-mobile.png, /tmp/shots/terra-index-desktop.png, /tmp/shots/terra-agg-mobile.png. git diff --check clean.

Report: what changed in the navbar and landing, files changed, and exact CSS techniques used for the polish.