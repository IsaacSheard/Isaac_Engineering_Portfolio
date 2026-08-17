// ==========================================================================
// Isaac Sheard — Portfolio
// Small progressive-enhancement script: terminal typing effect + nav state.
// No frameworks, no dependencies.
// ==========================================================================

document.addEventListener("DOMContentLoaded", () => {
  highlightActiveNav();
  typeTerminalLines();
});

// Mark the current page's nav link as active
function highlightActiveNav() {
  const path = window.location.pathname.split("/").pop() || "index.html";
  document.querySelectorAll(".nav-links a[data-nav]").forEach((link) => {
    if (link.dataset.nav === path) link.classList.add("active");
  });
}

// Types out a sequence of "commands" in the hero terminal, one at a time.
// Edit the `lines` array on each page (via data attribute) or override here.
function typeTerminalLines() {
  const body = document.querySelector("[data-terminal-body]");
  if (!body) return;

  let lines;
  try {
    lines = JSON.parse(body.dataset.lines || "[]");
  } catch (e) {
    lines = [];
  }
  if (!lines.length) return;

  const promptEl = document.createElement("span");
  promptEl.className = "prompt";
  promptEl.textContent = "isaac@portfolio:~$ ";

  const textEl = document.createElement("span");
  const caretEl = document.createElement("span");
  caretEl.className = "caret";

  body.textContent = "";
  body.appendChild(promptEl);
  body.appendChild(textEl);
  body.appendChild(caretEl);

  let lineIndex = 0;
  let charIndex = 0;
  const typeSpeed = 32;
  const pauseAfterLine = 1400;

  function tick() {
    const current = lines[lineIndex];
    if (charIndex <= current.length) {
      textEl.textContent = current.slice(0, charIndex);
      charIndex++;
      setTimeout(tick, typeSpeed);
    } else {
      setTimeout(() => {
        lineIndex = (lineIndex + 1) % lines.length;
        charIndex = 0;
        tick();
      }, pauseAfterLine);
    }
  }
  tick();
}
