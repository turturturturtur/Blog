/**
 * Switches between English and Chinese versions of pages when a counterpart is
 * available. When the current page has no translated counterpart, the toggle
 * falls back to the closest index page in the target language.
 */
(() => {
	const EN_TO_ZH = {
		"": "zh",
		Blog: "zh/Blog",
		Docs: "zh/Docs",
		"Docs/website-config-en": "Docs/website-config",
		"Docs/typst-example-en": "Docs/typst-example",
		"Docs/github-deploy-en": "Docs/github-deploy",
		"Docs/custom-styling-en": "Docs/custom-styling",
	};

	const ZH_TO_EN = Object.fromEntries(
		Object.entries(EN_TO_ZH).map(([englishPath, chinesePath]) => [
			chinesePath,
			englishPath,
		]),
	);

	function normalizePagePath(path) {
		return (path || "")
			.replace(/^\/+|\/+$/g, "")
			.replace(/\/index\.html$/i, "");
	}

	function getTargetPagePath(currentPath) {
		if (Object.prototype.hasOwnProperty.call(EN_TO_ZH, currentPath)) {
			return EN_TO_ZH[currentPath];
		}

		if (Object.prototype.hasOwnProperty.call(ZH_TO_EN, currentPath)) {
			return ZH_TO_EN[currentPath];
		}

		if (currentPath.startsWith("Docs/")) {
			const parts = currentPath.split("/");
			const last = parts[parts.length - 1];
			if (last.endsWith("-en")) {
				parts[parts.length - 1] = last.slice(0, -3);
			} else {
				parts[parts.length - 1] = `${last}-en`;
			}
			return parts.join("/");
		}

		if (currentPath.startsWith("Blog/")) {
			return "zh/Blog";
		}

		if (currentPath === "zh" || currentPath.startsWith("zh/")) {
			return currentPath.replace(/^zh\/?/, "");
		}

		return "zh";
	}

	function toRelativeUrl(currentPath, targetPath) {
		const currentDepth = currentPath === "" ? 0 : currentPath.split("/").length;
		const prefix = currentDepth === 0 ? "" : "../".repeat(currentDepth);

		if (targetPath === "") {
			return prefix || "./";
		}

		return `${prefix}${targetPath}/`;
	}

	function isChinesePath(path, lang) {
		return (
			path === "zh" ||
			path.startsWith("zh/") ||
			(path.startsWith("Docs/") && !path.endsWith("-en") && path !== "Docs") ||
			lang.toLowerCase().startsWith("zh")
		);
	}

	function initLanguageToggle() {
		const button = document.getElementById("language-toggle");
		if (!button) return;

		const currentPath = normalizePagePath(button.dataset.pagePath);
		const currentLang =
			button.dataset.currentLang || document.documentElement.lang || "en";
		const isChinese = isChinesePath(currentPath, currentLang);
		const targetPath = getTargetPagePath(currentPath);

		button.textContent = isChinese ? "EN" : "中";
		button.setAttribute(
			"aria-label",
			isChinese ? "Switch to English" : "Switch to Chinese",
		);
		button.title = isChinese ? "Switch to English" : "Switch to Chinese";

		button.addEventListener("click", () => {
			window.location.href = toRelativeUrl(currentPath, targetPath);
		});
	}

	if (document.readyState === "loading") {
		document.addEventListener("DOMContentLoaded", initLanguageToggle);
	} else {
		initLanguageToggle();
	}
})();
