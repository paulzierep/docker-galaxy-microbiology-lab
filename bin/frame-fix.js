(function () {
  if (window.self === window.top) return;

  document.addEventListener("click", function (e) {
    const link = e.target.closest("a");
    if (!link) return;

    const href = link.getAttribute("href");
    if (!href) return;

    if (
      href.startsWith("#") ||
      href.startsWith("javascript:") ||
      href.startsWith("mailto:") ||
      href.startsWith("tel:")
    ) return;

    // Respect existing frame targets (Galaxy internal frames)
    if (link.hasAttribute("target") && link.target !== "") return;

    const linkUrl = new URL(link.href, window.location.href);
    const currentUrl = new URL(window.location.href);

    // Allow same-page navigation
    if (
      linkUrl.origin === currentUrl.origin &&
      linkUrl.pathname === currentUrl.pathname &&
      linkUrl.search === currentUrl.search
    ) return;

    // Otherwise escape iframe
    e.preventDefault();
    window.top.location.href = linkUrl.href;
  });
})();
