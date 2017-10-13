# Changelog

## 2.2.0

> Oct 11, 2017

- **NEW**: Remove deprecations.
- **NEW**: Update `rgba` library.
- **NEW**: Expose contrast.
- **NEW**: Add support for PackageDev settings completions/tooltips/linting.
- **Fix**: Hide scratch output panel.
- **FIX**: Increase block code font size to `1rem`.
- **FIX**: Better YAML stripping logic.
- **FIX**: More descriptive failure message.

## 2.1.1

> June 21, 2017

- **FIX**: Strip frontmatter when `md=False`. Throw it away as we only use the frontmatter for Markdown.

## 2.1.0

> June 20, 2017

- **NEW**: Allow adding and configuring extensions via YAML frontmatter. This feature deprecates `nl2br` function parameter which will be removed some time in the future.
- **NEW**: Allow setting whether block, code tags will allow word wrapping via YAML frontmatter. This feature deprecates the `allow_word_wrap` function parameter which will be removed some time in the future.
- **NEW**: Expose SuperFences' `custom_fences` feature via YAML frontmatter.
- **NEW**: Upgrade internal extensions.
- **NEW**: Import official `pymdownx` extension if `pymdownx` is installed as a dependency so we can drop internal vendored extension copies in the future. This is allowed to be optional for a time until people can update their dependencies.
- **NEW**: Import `pyyaml` extension if `pyyaml` is installed for frontmatter. This is allowed to be optional for a time until people can update their dependencies.
- **NEW**: `inline-highlight` class in no longer applied to inline code.  Instead `highlight` is applied to both inline and block code.

## 2.0

> June 1, 2017

- **NEW**: Add `kbd` styling and `admontion` styling.
- **NEW**: New rewritten `default.css`. Adds styling that uses new Sublime CSS features and drops legacy styling for old ST versions. No more `base.css`.
- **NEW**: No longer outputs scope CSS into default CSS. Users must use template to acquire CSS for specific scopes. This helps keep the CSS namespace clean. In general, CSS should start using Sublime CSS variables like `--bluish`, `--redish` etc.  If a user needs CSS for a scope, they can use the `css` template filter to add the scope's CSS to a class of their choice.
- **NEW**: MdPopups now requires ST 3124+ and all legacy styling and workarounds for ST < 3124 have been dropped.
- **NEW**: Code blocks are now forced to use a monospace fonts.
- **NEW**: Legacy `relativesize` template filter has been dropped. Users should use native CSS `rem` units for relative sizes.
- **NEW**: Upgraded `pymdownx` extensions which includes fixes and enhancements. Also abandoned using `CodeHilite` in favor of `pymdownx.highlight`.
- **NEW**: Add option to support wrapping in code blocks.
- **NEW**: CSS filters are no longer limited to a set list of TextMate or Sublime scopes, and you no longer specify the parameters as CSS classes (but MdPopups will be forgiving if you do), but you should specify them as scopes (complexity doesn't matter). Also no more specifying multiple scopes separated by commas. Read documentation for more info.
- **NEW**: CSS filter now accepts an `explicit_background` option to return a background only when explicitly defined (which is the default). When disabled, the filter will always return a valid background color (which is usually the base background).
- **NEW**: Pygments is no longer the default syntax highlighter.
- **FIX**: Fix foreground output that was missing semicolon according to spec.
- **FIX**: Numerous CSS fixes.

## 1.0

> Nov 12, 2015

- **NEW**: First release.

--8<-- "refs.md"
