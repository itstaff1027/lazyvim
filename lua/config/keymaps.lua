-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
vim.keymap.set({ "n", "v" }, "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select All" })

-- Toggle comment with Ctrl+/
-- In Normal mode: 🎯 gcc  (toggle current line)
-- In Visual mode: 🎯 gc   (toggle selection)
vim.keymap.set(
  { "n" }, -- modes
  "<C-/>", -- <Ctrl> + Shift + /
  "gcc", -- invoke the normal-mode mapping
  { remap = true, silent = true, desc = "Toggle comment line" }
)

vim.keymap.set(
  { "v" },
  "<C-/>",
  "gc", -- invoke the visual-mode mapping
  { remap = true, silent = true, desc = "Toggle comment selection" }
)
