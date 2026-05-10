# linux_config

Personal Linux dotfiles managed in git.

## Structure

- `wezterm/wezterm.lua`: source of truth for WezTerm config
- `git/`: reserved for git-related config files
- `shell/`: reserved for shell-related config files
- `ssh/README.md`: GitHub SSH key setup notes

## Active links

- `~/.wezterm.lua` loads `work/linux_config/wezterm/wezterm.lua`

## Notes

- Keep application entry files in their default locations when the app expects them there.
- Store the real config in this repository and have the default location delegate to it.
