# AGENTS.md

## Layout

- `docs/` is the published site (GitHub Pages: `master` branch, `/docs` folder). Anything outside it is not served.
- `docs/index.html` is the site. It is a single hand-written HTML file with inline CSS.
- `docs/archive/` is the old Hugo-generated site, kept for reference. Treat it as read-only. Its links were rewritten to `/archive/…` and each page has an "Archived" banner right after `<body>`.
- `docs/CNAME` (`craigwickesser.com`) and `docs/.nojekyll` are required for Pages. Don't remove them.

## Rules

- Keep it one page with no build step, no framework and no JavaScript unless it's truly needed.
- Fonts come from Google Fonts: Schibsted Grotesk (display), Newsreader (body), Martian Mono (small labels and links).
- Colours are CSS custom properties on `:root`, redefined under `prefers-color-scheme: dark`:
  - light: paper `#f5f6f7`, ink `#15171b`, muted `#5b616b`, rule `#dde0e4`, accent `#d67200`
  - dark: paper `#0f1114`, ink `#ecedef`, muted `#9aa0a9`, rule `#262a30`, accent `#f7931e`
- The accent is Codescratch orange. Use it sparingly: the Codescratch name, link arrows and hover states.
- The page must work at phone width (16px side gutter, no horizontal scroll), show visible keyboard focus and respect `prefers-reduced-motion`.
- The portrait (`docs/craig.jpg`, 240×240) sits inline inside the `<h1>` after "Craig". To remove it, delete the `<img>`.

## Preview

`python3 -m http.server 8000 --directory docs`
