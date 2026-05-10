# Repository Guidelines

## Project Structure & Module Organization

This repository stores Linux configuration files and setup notes. Keep the repo as the source of truth and let files in default system locations delegate to it when needed.

- [`wezterm/wezterm.lua`](/home/guo/work/linux_config/wezterm/wezterm.lua:1): WezTerm configuration
- [`shell/zshrc`](/home/guo/work/linux_config/shell/zshrc:1): shared `zsh` bootstrap and `starship` init
- [`shell/README.md`](/home/guo/work/linux_config/shell/README.md:1): shell wiring notes
- [`rime/README.md`](/home/guo/work/linux_config/rime/README.md:1): Rime setup and Xiaohe notes
- [`ssh/README.md`](/home/guo/work/linux_config/ssh/README.md:1): SSH setup notes
- `git/`: reserved for future Git-related config

## Build, Test, and Development Commands

There is no build system in this repository. Use lightweight validation before committing:

- `git status --short --branch`: confirm the intended file scope
- `git diff --stat`: review the size of the change
- `zsh -n shell/zshrc`: syntax-check shell config
- `wezterm start --config-file wezterm/wezterm.lua`: verify WezTerm can load the config

When editing docs, preview the Markdown locally if your editor supports it.

## Coding Style & Naming Conventions

Use ASCII by default unless a file already contains non-ASCII text, such as Chinese setup notes. Prefer 2-space indentation in shell snippets and YAML examples. Keep config files minimal and comment only where behavior is not obvious.

Name new setup docs as `README.md` inside a topic directory, for example `rime/README.md`. Keep executable config filenames aligned with the target application, such as `wezterm.lua` or `zshrc`.

## Testing Guidelines

No automated test suite is configured. Validate each change with the smallest relevant command and, when applicable, reload the affected tool manually. Example: run `ibus restart` after changing Rime-related instructions, or start a new `zsh` session after editing `shell/zshrc`.

## Commit & Pull Request Guidelines

Recent commits use short, imperative messages such as `add rime setup notes` and `add zsh and starship config`. Follow that style: one line, lowercase, focused on the user-visible change.

Pull requests should summarize what changed, why it changed, and how it was verified. Include screenshots only for terminal UI changes where appearance matters.
