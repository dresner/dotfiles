return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter'.install { 'bash', 'c', 'csv', 'cpp', 'diff','go', 'html', 'javascript', 'jq', 'json', 'lua', 'make', 'markdown_inline', 'python', 'regex', 'rust', 'typescript', 'yaml'}
  end
}
