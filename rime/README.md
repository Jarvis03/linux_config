# Rime 小鹤双拼配置记录

这台机器是 Ubuntu 24.04，输入法框架使用 `IBus`。

## 安装的包

先安装 `Rime` 本体：

```bash
sudo apt-get install -y ibus-rime
```

再安装双拼方案数据：

```bash
sudo apt-get install -y rime-data-double-pinyin
```

安装完成后，把 `Rime` 加入 GNOME 输入源：

```bash
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'libpinyin'), ('ibus', 'rime')]"
ibus restart
```

如果不需要 `libpinyin`，也可以只保留：

```bash
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'rime')]"
ibus restart
```

## 小鹤双拼方案

系统包安装后，小鹤双拼方案文件在：

```text
/usr/share/rime-data/double_pinyin_flypy.schema.yaml
```

其中 `double_pinyin_flypy` 就是小鹤双拼。

## 用户配置

创建 Rime 用户配置目录：

```bash
mkdir -p ~/.config/ibus/rime
```

新建文件 `~/.config/ibus/rime/default.custom.yaml`：

```yaml
patch:
  schema_list:
    - schema: double_pinyin_flypy
```

这个配置的作用是把 `Rime` 的方案列表设置为小鹤双拼。

## 默认使用简体

小鹤方案本身带有 `simplification` 开关。为了让它默认使用简体，新增文件
`~/.config/ibus/rime/double_pinyin_flypy.custom.yaml`：

```yaml
patch:
  switches/@2/reset: 1
```

含义：

- `switches/@2` 指向小鹤方案里的第三个开关，也就是 `simplification`
- `reset: 1` 表示默认落到第二个状态，即 `汉字`，也就是简体

## 重新加载

写完配置后重启 `IBus`：

```bash
ibus restart
```

如果当前会话里没有立刻生效，重新登录一次。

## 当前机器上的相关配置文件

- `Rime` 方案列表配置：
  `/home/guo/.config/ibus/rime/default.custom.yaml`
- `Rime` 小鹤简体默认配置：
  `/home/guo/.config/ibus/rime/double_pinyin_flypy.custom.yaml`

## 补充

这台机器上现在同时有两套中文输入方案：

- `libpinyin`：当前已设置为全拼
- `Rime`：已设置为小鹤双拼，默认简体
