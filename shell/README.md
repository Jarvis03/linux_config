# Shell config

## Files

- `zshrc`: minimal zsh bootstrap with `starship` and optional `zsh-syntax-highlighting` / `zsh-autosuggestions`

## Suggested local wiring

Make `~/.zshrc` delegate to the repository copy:

```zsh
source ~/work/linux_config/shell/zshrc
```

## Optional packages

For command highlighting and suggestions, install these packages if available on your distro:

```sh
sudo apt-get install zsh-syntax-highlighting zsh-autosuggestions
```
