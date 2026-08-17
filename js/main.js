// ==========================================================================
// Isaac Sheard — Portfolio
// Progressive enhancement: highlights the active nav link.
// No frameworks, no dependencies.
// ==========================================================================

document.addEventListener("DOMContentLoaded", () => {
  highlightActiveNav();
});

function highlightActiveNav() {
  const path = window.location.pathname.split("/").pop() || "index.html";
  document.querySelectorAll(".nav-links a[data-nav]").forEach((link) => {
    if (link.dataset.nav === path) link.classList.add("active");
  });
}
