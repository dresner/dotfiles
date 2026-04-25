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
-- Open terminal on the left
vim.keymap.set("n", "<leader>t", function()
  local width = vim.api.nvim_win_get_width(0)
  width = math.ceil(width * 0.27)
  if width < 20 then width = 20 end
  vim.cmd.new()
  vim.cmd.term()
  Tchan = vim.bo.channel
  vim.cmd.wincmd("H")
  vim.api.nvim_win_set_width(0, width)
  vim.cmd.normal("i")
end)

function Setwatch(cmd)
  cmd = "clear;\n" .. cmd .. "\n"
  local group = vim.api.nvim_create_augroup("WatchCommand", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    callback = function()
      vim.api.nvim_chan_send(Tchan, cmd)
    end,
  })
end

-- Escape terminal mode with Esc Esc
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
-- Get out of terminal window with <c-w>w
vim.keymap.set("t", "<c-w>w", "<c-\\><c-n><c-w>w")
vim.keymap.set("t", "<c-w><c-w>", "<c-\\><c-n><c-w><c-w>")
