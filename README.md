# linux_config

Personal Linux dotfiles managed in git.

## Structure

- `wezterm/wezterm.lua`: source of truth for WezTerm config
- `wezterm/README.md`: WezTerm theme, tab bar, and shortcut notes
- `git/`: reserved for git-related config files
- `rime/README.md`: Rime 小鹤双拼安装和配置记录
- `shell/zshrc`: source-controlled zsh bootstrap with `starship`
- `shell/README.md`: shell setup notes
- `ssh/README.md`: GitHub SSH key setup notes

## Active links

- `~/.wezterm.lua` loads `work/linux_config/wezterm/wezterm.lua`
- `~/.zshrc` should source `work/linux_config/shell/zshrc`

## Notes

- Keep application entry files in their default locations when the app expects them there.
- Store the real config in this repository and have the default location delegate to it.
