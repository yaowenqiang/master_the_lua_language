> repl.it

> apt install lua5.3


> os.exit()


> brew install lua-language-server

## Neovim Lua 调试 (nvim-dap + osv)

需要两个 Neovim 实例：一个跑脚本（debuggee），一个看代码（编辑器）。

```bash
# 终端 1: debuggee（注意不要加 --headless，否则没法输入 :luafile）
nvim -c "lua require('osv').launch({port=8086})"
```

```bash
# 终端 2: 编辑器，打开脚本，<leader>db 在目标行设断点，然后 <leader>dc 连接
nvim myscript.lua
```

连接成功后回终端 1 执行 `:luafile myscript.lua`，命中断点后在编辑器里单步：

| 按键 | 作用 |
|------|------|
| `<leader>db` | 设/删断点 |
| `<leader>dc` | 连接调试器 / 继续执行 |
| `<leader>dl` | 在 debuggee 里启动 osv 服务器 |
| `<leader>do` | 单步跳过 (step over) |
| `<leader>di` | 单步进入 (step into) |
| `<leader>dO` | 单步跳出 (step out) |
| `<leader>dh` | 查看光标下变量 |
| `<leader>df` | 调用栈浮窗 |
| `<leader>dr` | REPL（求值表达式） |

注意：nvim-dap 会自动读 `.vscode/launch.json`。旧的 LuaPanda 配置已改名为
`.vscode/launch.json.lupanda.bak`，不要恢复它，否则会污染调试配置列表。

> google color picker
