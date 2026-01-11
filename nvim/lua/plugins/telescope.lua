return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { "nvim-tree/nvim-web-devicons",              opts = {} },
      'BurntSushi/ripgrep',
    },
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {}
        }
      }
      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>be', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>m', builtin.man_pages, { desc = 'Telescope man pages' })
    end
  }
}
