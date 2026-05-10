# WezTerm 使用说明

## 当前配置

- 主题：`Tokyo Night`
- 默认 Shell：`zsh`
- 标签栏：始终显示，位于窗口底部
- 窗口按钮：最小化、最大化、关闭，集成在标签栏右侧
- 右侧状态栏：显示当前主题名

## 常用操作

- 新建标签页：`Ctrl+Shift+t`
- 关闭当前标签页：`Ctrl+Shift+w`
- 循环切换主题：`Ctrl+a` 然后 `t`
- 左移当前标签页：`Ctrl+Shift+PageUp`
- 右移当前标签页：`Ctrl+Shift+PageDown`
- 垂直分屏：`Ctrl+a` 然后 `-`
- 水平分屏：`Ctrl+a` 然后 `\`
- 在窗格间移动：`Ctrl+a` 然后 `h/j/k/l`
- 重载配置：`Ctrl+a` 然后 `r`

## 如何切换主题

默认最方便的方式是直接按：

`Ctrl+a t`

它会在这一组内置主题里循环切换：

- `Tokyo Night`
- `Tokyo Night Storm`
- `Catppuccin Mocha`
- `Catppuccin Macchiato`
- `Gruvbox Dark`
- `Rosé Pine Moon`

当前主题会显示在右侧状态栏。

如果你想修改默认启动主题，编辑 [`wezterm.lua`](./wezterm.lua) 里的这一行：

```lua
config.color_scheme = "Tokyo Night"
```

保存后通常会自动重载；如果没有生效，按 `Ctrl+a r`。

查看可用主题：

```bash
wezterm ls-colors | less
```

## 标签栏说明

- 标签栏已经固定显示，不会因为只剩一个标签页而隐藏
- 标签栏在底部，由 `tab_bar_at_bottom = true` 控制
- 窗口按钮显示在标签栏右侧，由 `INTEGRATED_BUTTONS|RESIZE` 控制
- 可以直接拖动标签页改变顺序，也可以用 `Ctrl+Shift+PageUp/PageDown`
