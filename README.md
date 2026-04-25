# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# Lazygit Edit Same NeoVim Session

In `~/Library/Application\ Support/lazygit/config.yml`

```
os:
  editPreset: "nvim"
  edit: "if [ -n \"$NVIM\" ]; then nvim --server $NVIM --remote-send '<C-\\><C-n><cmd>close<cr>' && nvim --server $NVIM --remote {{filename}}; else nvim {{filename}}; fi"
  editInTerminal: true
```
