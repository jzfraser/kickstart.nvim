-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- Incredible git client
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>go', vim.cmd.Git, { desc = '[G]it [O]pen' })
    end,
  },

  -- View edits as a tree and undo/redo changes
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = '[U]ndotree' })
    end,
  },

  -- java lsp (work)
  {
    'mfussenegger/nvim-jdtls',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
  },

  -- handlebars editing (work)
  {
    'mustache/vim-mustache-handlebars',
  },
}
