-- Basic vim preferences
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smarttab = true
vim.opt.scrolloff = 5
vim.opt.nu = true
vim.g.mapleader = ","
-- Disable auto comments
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]

-- Load plugins
require("config.lazy")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'bash', 'c', 'csv', 'cpp', 'diff', 'go', 'html', 'javascript', 'jq', 'json', 'lua', 'make', 'markdown_inline', 'python', 'regex', 'rust', 'typescript', 'yaml' },
  callback = function() vim.treesitter.start() end,
})

-- Visual options
vim.cmd [[colorscheme tokyonight-day]]

-- Custom commands
-- Run the current line as lua command
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
-- Run the current selection as lua command
vim.keymap.set("v", "<leader>x", ":lua<CR>")
-- Source the current file
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
-- Open terminal below
vim.keymap.set("n", "<leader>t", function()
  local height = vim.api.nvim_win_get_height(0)
  height = math.ceil(height * 0.27)
  if height > 15 then height = 15 end
  if height < 5 then height = 5 end
  vim.cmd.vnew()
  vim.cmd.term()
  Tchan = vim.bo.channel
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, height)
  vim.cmd.normal("i")
end)

function Setwatch(cmd)
  cmd = "clear; " .. cmd .. "\r\n"
  vim.api.nvim_create_autocmd('BufWritePost',
    { callback = function() vim.api.nvim_chan_send(Tchan, cmd) end })
end
