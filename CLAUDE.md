# Isaac Engineering Portfolio — Project Context

Personal engineering portfolio for Isaac Sheard (MIT Aerospace Engineering).
Hand-coded static site — plain HTML/CSS/JS, no framework, no build step.
Inspired by Ehinome Ehikhametalor's portfolio (metalor.myportfolio.com) but
built from scratch with a distinct dark/technical "maker's workbench" theme.

## Status: scaffolded, needs real content

The structure, design, and all pages exist. What's left is filling in
placeholder content — this is NOT a from-scratch build, it's a content pass.

## Structure

```
index.html          home page (hero + featured projects grid)
projects.html        full projects gallery
about.html            bio, timeline, skills
css/style.css         all styling (CSS custom properties in :root)
js/main.js             nav active-state + hero terminal typing effect
projects/
  mit-rocket-team.html
  frc-megahertz.html
  sun-tracking-payload.html
  3d-printer-upgrades.html
  agco-internship.html
```

Each project page follows the same template: hero (title, summary, meta-bar),
then 4 content blocks — Problem / Approach / What I Built / Results.

## What needs to be done (in priority order)

1. **Fill every `[PLACEHOLDER — ...]` block.** Search all files for
   `PLACEHOLDER` — each marks a spot needing real detail: role, dates, team
   size, tools, and the actual problem/approach/build/results narrative for
   each project. Isaac has the real details; ask him rather than inventing
   specifics.
2. **Resume link**: `<a class="resume-link" href="#" ...>` appears on every
   page — replace `#` with a real resume URL (Google Drive link, or a PDF
   dropped in an `assets/` folder and linked directly).
3. **GitHub link**: footer `<a href="#" ...>GitHub</a>` on every page — same
   deal, needs the real profile URL.
4. **Photos/diagrams**: each project page has dashed `placeholder-box` divs
   inside a `media-grid`. Replace with real `<img>` tags once Isaac provides
   images (create an `assets/` folder for these).
5. **About page bio**: `about.html` has a rough draft bio and a timeline with
   bracketed placeholders like `[Dates]`, `[year]` — needs real dates and a
   pass for voice/accuracy.

## Design system (css/style.css)

CSS custom properties at the top of the file control the whole theme —
change colors/fonts there rather than hunting through individual rules.
Key ones: `--accent` (orange), `--cyan` (secondary accent), `--bg`/`--panel`
(dark backgrounds), `--mono` (JetBrains Mono for technical/label text).

## Conventions to follow when extending

- No frameworks. Keep it plain HTML/CSS/JS — that's a deliberate choice, not
  a temporary state.
- Every page repeats the same header/nav/footer markup (no templating engine
  in use) — when editing one, check if the same change applies to all pages.
- Project detail pages live in `projects/` and use `../` relative paths back
  to root; root-level pages use plain relative paths.
- New projects: copy an existing file in `projects/`, update content, add a
  matching card to both `index.html` (Featured Work) and `projects.html`,
  and fix the prev/next links at the bottom of adjacent project pages.

## Deploy

GitHub Pages, deploying from `main` branch root. See README.md for the full
step-by-step (already set up as of this writing — repo is on GitHub).
