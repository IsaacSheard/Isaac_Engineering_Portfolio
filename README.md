# isaac-portfolio

A hand-coded portfolio site — no template, no framework. Plain HTML/CSS/JS.

## Structure

```
Isaac_Engineering_Portfolio/
├── index.html              # home page
├── projects.html           # projects gallery
├── about.html               # about / skills / timeline
├── css/style.css            # all styling (one shared file)
├── js/main.js                # nav highlighting + hero terminal typing effect
└── projects/
    ├── mit-rocket-team.html
    ├── frc-megahertz.html
    ├── sun-tracking-payload.html
    ├── 3d-printer-upgrades.html
    └── agco-internship.html
```

## What to fill in before publishing

Every project page has `[PLACEHOLDER — ...]` text marking where to add your own
details, numbers, and story. Search each file for `PLACEHOLDER` and replace.

Other things to update:
- **Resume link**: the "Resume ↗" nav button on every page currently points to `#`.
  Replace with a link to your resume (Google Drive, or drop a PDF in `assets/` and
  link to it directly).
- **GitHub link**: footer "GitHub" link on every page points to `#` — add your
  GitHub profile URL.
- **Photos/diagrams**: each project page has dashed placeholder boxes
  (`placeholder-box`) in a `media-grid`. Drop real images into `assets/`, then
  replace each `<div class="placeholder-box">...</div>` with
  `<img src="../assets/your-photo.jpg" alt="...">` (use `assets/...` without `../`
  on `index.html`/`about.html`/`projects.html`).
- **Meta bars**: role, timeline, tools on each project page — currently bracketed
  placeholders like `[Add dates]`.

## Preview locally

No build step needed — it's static HTML. Just open `index.html` in a browser, or
run a tiny local server from this folder:

```bash
python3 -m http.server 8000
# then visit http://localhost:8000
```

## Deploy for free on GitHub Pages

This folder already lives at `Documents/GitHub/Isaac_Engineering_Portfolio` — the
default location GitHub Desktop uses, so you can either use GitHub Desktop or the
command line below.

1. Create a new repo on GitHub called `Isaac_Engineering_Portfolio` (or rename it —
   any name works, it just changes the URL).
2. From this folder:
   ```bash
   git init
   git add .
   git commit -m "Initial portfolio"
   git branch -M main
   git remote add origin https://github.com/<your-username>/Isaac_Engineering_Portfolio.git
   git push -u origin main
   ```
   Or, in GitHub Desktop: **File → Add Local Repository** → select this folder →
   **Publish repository**.
3. On GitHub: **Settings → Pages → Source → Deploy from branch → `main` / `root`**.
   Save.
4. Site goes live at `https://<your-username>.github.io/Isaac_Engineering_Portfolio/`
   within a minute or two.
5. Optional: add a custom domain later under the same Pages settings.

## Adding a new project later

1. Copy any file in `projects/` as a starting template.
2. Update the `<title>`, breadcrumb, hero text, meta bar, and content blocks.
3. Fix the "prev/next" links at the bottom to slot it into the sequence.
4. Add a matching card to `index.html` (Featured Work grid) and `projects.html`.

## Design notes

Dark, technical, "maker's workbench" theme — monospace accents (JetBrains Mono),
orange/cyan accent colors, subtle grid background, terminal-style typing effect
in the hero. All in `css/style.css` as CSS custom properties (`:root` at the top)
if you want to retheme colors later.
