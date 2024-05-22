-- vim: ts=2 sts=2 sw=2 et
local set = vim.keymap.set

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

set("n", "<leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ""
  else
    return "<CR>"
  end
end, { expr = true })

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<C-w>5<", { desc = "Decrease the width of the window" })
set("n", "<M-.>", "<C-w>5>", { desc = "Increase the width of the window" })
set("n", "<M-t>", "<C-W>+", { desc = "Increase the height of the window" })
set("n", "<M-s>", "<C-W>-", { desc = "Decrease the height of the window" })

set("n", "<M-j>", function()
  if vim.opt.diff:get() then
    vim.cmd([[normal! ]c]])
  else
    vim.cmd([[m .+1<CR>==]])
  end
end)

set("n", "<M-k>", function()
  if vim.opt.diff:get() then
    vim.cmd([[normal! [c]])
  else
    vim.cmd([[m .-2<CR>==]])
  end
end)
