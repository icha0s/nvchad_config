local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
autocmd("BufEnter", {
  pattern = "*",
  command = "set tw=0",
})

vim.opt.colorcolumn = "120"
vim.opt.relativenumber = true
-- highlight yanked text for 200ms using the "IncSearch" highlight group
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
})

-- vim.cmd[[
-- augroup highlight_yank
-- autocmd!
-- au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
-- augroup END
-- ]]
