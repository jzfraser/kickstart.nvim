return {
  {
    'github/copilot.vim',
    event = 'InsertEnter',
    config = function()
      vim.keymap.set('i', '<C-J>', 'copilot#Accept("")', {
        expr = true,
        replace_keycodes = false,
      })

      vim.keymap.set('i', '<C-G>', '<Plug>(copilot-dismiss)', { desc = 'Dismiss Copilot suggestion' })
      vim.keymap.set('i', '<C-L>', '<Plug>(copilot-next)', { desc = 'Next Copilot suggestion' })
      vim.keymap.set('i', '<C-H>', '<Plug>(copilot-previous)', { desc = 'Previous Copilot suggestion' })
      vim.keymap.set('i', '<C-S>', '<Cmd>Copilot panel <CR>', { desc = 'Open Copilot suggestions' })

      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    opts = {
      -- See Configuration section for options
      -- window = {
      --   layout = 'horizontal',
      -- },
    },
    -- See Commands section for default commands if you want to lazy load on them
    config = function(_, opts)
      local chat = require 'CopilotChat'
      chat.setup(opts)

      vim.keymap.set('n', '<leader>cc', '<Cmd>CopilotChat<CR>', { desc = 'Open Copilot Chat' })
    end,
  },
}
