# Repository Guidelines

## Operating Rule For Future Agents

This repository has moved from template-building mode to article-polishing mode. Unless the user explicitly authorizes a broader change in the current turn, future agents must only edit the specific article file or article-local assets under `content/Blog/YYYY-MM-DD-topic-name/`.

Default allowed edits:

- `content/Blog/YYYY-MM-DD-topic-name/index.typ` for the article being refined.
- Files inside that same article directory, such as `imgs/`, only when the article itself needs them.

Default forbidden edits without explicit user approval:

- `content/Blog/index.typ`, because it is the archive and taxonomy page.
- `content/index.typ`, `content/zh/`, `content/Docs/`, and `content/CV/`.
- `config.typ`, `build.py`, `tufted-lib/`, `assets/`, templates, theme files, navigation, metadata plumbing, RSS logic, and deployment structure.
- `_site/`, because it is generated output.

If an article-polishing request appears to require archive, style, template, build, or navigation changes, stop and ask the user for explicit approval before touching those files. The expected future task is careful content editing, not architecture or layout redesign.

## Project Structure And Responsibilities

This repository is a Typst-based static blog. Source files live under `content/`; generated output goes to `_site/`.

- `content/index.typ`: English homepage. It gives the public entrypoints and high-level topic list. Do not change it for ordinary article editing.
- `content/Blog/index.typ`: English article archive and taxonomy page. It lists major categories, subcategories, and timeline entries. It is not an article.
- `content/Blog/YYYY-MM-DD-topic-name/index.typ`: one blog article. This is the main file future agents should edit when refining writing.
- `content/Blog/YYYY-MM-DD-topic-name/imgs/`: optional article-local images. Keep images close to the article that uses them.
- `content/_templates/blog-post.typ`: starter template for new posts. Do not change it during article polishing.
- `content/zh/`: Chinese mirror pages and Chinese-facing navigation. It exists for bilingual presentation, but future polishing tasks should not edit it unless the user explicitly asks for bilingual page work. When archive, taxonomy, navigation, or article-entry changes are authorized, update the Chinese mirror in the same turn and verify it against the English page.
- `content/Docs/`: documentation pages for the site template and setup. Do not edit during blog article work.
- `content/CV/`: resume/CV source files, bibliography files, and PDF-producing Typst files. Do not edit during blog article work.
- `config.typ`: site-wide template configuration, navigation, author, metadata, language defaults, feed directories, header, and footer.
- `tufted-lib/`: shared Typst library code for layout, metadata, bylines, figures, notes, links, math, references, and blog-entry rendering.
- `assets/`: browser-side CSS and JavaScript such as theme toggles, language toggles, code block helpers, table of contents behavior, and custom styles.
- `build.py`: build, preview, asset-copying, RSS, sitemap, and incremental compilation script.
- `_site/`: generated HTML/PDF/assets/RSS/sitemap output. Never edit or commit this directory.

## Blog Taxonomy

The public default language is English. Chinese-facing pages must stay structurally aligned with the English pages whenever a Blog archive, taxonomy, navigation, or article-entry change is made.

Recent taxonomy change:

- Added a standalone Blog archive category for technical report analysis: `Tech Report Analysis` / `技术报告分析`.
- This category is for analyses of mainstream open-source model technical reports, including model architecture, training data, post-training, evaluation, efficiency, and deployment implications.
- The change is present in both `content/Blog/index.typ` and `content/zh/Blog/index.typ`.

Current main categories:

- `AI Infra`
- `Data curation`
- `Math`
- `RL`
- `OPD`
- `Agent`
- `Tech Report Analysis`
- `Project Management Experience`

Current `AI Infra` subcategories:

- `triton`
- `c++`
- `megatron`
- `verl`
- `vllm`
- `slime`
- `sglang`

Current `Data curation` subcategories:

- `Data Mixture`
- `Data Selection`
- `Data Filtering`

Current `Tech Report Analysis` subcategories:

- `DeepSeek`
- `MiniMax`
- `MiMo`
- `GLM`
- `Qwen`
- `OLMo`
- `Other Open Models`

`RL`, `OPD`, and `Agent` subcategories are intentionally blank for now. Do not invent new subcategories unless the user asks.

Article metadata convention:

- `title`: public article title.
- `description`: one-sentence summary used by archives, RSS, and search previews.
- `date`: publication date as `datetime(year: YYYY, month: M, day: D)`.
- `lang`: usually `"en"` for public default articles.
- `extra-info`: visible category and tag summary below the title.
- Archive entries use `category` for the main category and put the primary subcategory first in `tags`.

## Mandatory Bilingual Alignment Check

This is a hard requirement. Do not repeat the mistake of changing only the English Blog archive when the Chinese mirror exists.

When editing either `content/Blog/index.typ` or `content/zh/Blog/index.typ`, inspect both files and keep them aligned in the same turn unless the user explicitly says the change is single-language only.

Check these items before reporting completion:

- Quick-index links: same anchors, same order, translated labels allowed on the Chinese page.
- Section structure: matching `h2` ids for every archive category.
- Subcategory chips: same category coverage and same order; proper nouns such as model family names should stay identical unless there is an established Chinese display label.
- Article entries: matching dates, paths, timeline placement, and category/tag intent; titles and descriptions may be translated.
- Empty-state notes: both languages should communicate the same publishing convention.

After any bilingual archive or taxonomy change, run `uv run build.py build -f` and report whether it passed. If the build is blocked by unrelated dirty worktree changes, say so clearly and still report the bilingual alignment check you performed.

## Article Editing Style

Keep article edits focused and readable. Prefer improving the argument, structure, examples, terminology, and transitions over changing site mechanics. Preserve nearby Typst style and imports.

For technical articles:

- Put the practical takeaway early.
- Keep commands, formulas, and code blocks reproducible.
- Use headings that name the actual concept or step.
- Use margin notes only for side context, reminders, or references that would interrupt the main flow.
- Keep Chinese explanatory comments when they help future maintenance, but keep public default article text in English unless the user asks otherwise.

## Build, Test, And Preview Commands

- `uv run build.py build`: compile HTML, PDFs, static assets, RSS, and sitemap into `_site/`.
- `uv run build.py build -f`: force a complete rebuild. Use this before reporting completion after any article edit.
- `uv run build.py html`: compile only HTML pages from `content/`.
- `uv run build.py pdf`: compile only `.typ` files that produce PDF output, such as filenames containing `PDF`.
- `uv run build.py assets`: copy CSS, JS, and other static assets.
- `uv run build.py clean`: remove generated output.
- `uv run build.py preview -p 8000`: serve `_site/` locally. If port 8000 is occupied, use another port.
- Without `uv`, run `python build.py ...`.

There is no separate unit test suite. For ordinary article edits, run `uv run build.py build -f` and report whether it passed. Only run preview checks for visual, navigation, CSS, JS, archive, RSS, or sitemap work.

## Git And Commit Guidelines

Use clear imperative commit messages, such as `Refine AI infra article` or `Update agent repository guidance`.

Do not commit generated output, virtual environments, logs, editor files, or local machine paths. In particular, do not commit `_site/`.

Before committing, inspect `git status --short` and stage only files that belong to the user-approved task. If unrelated changes exist, leave them unstaged unless the user explicitly asks to include them.

## Security And Configuration

Do not commit secrets, tokens, private credentials, or local-only paths. Public site settings belong in `config.typ`, static public files belong in `assets/`, and generated deployment output belongs only in `_site/`.
