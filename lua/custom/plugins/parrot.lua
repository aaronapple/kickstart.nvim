return {
  'frankroeder/parrot.nvim',
  dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
  -- optionally include "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    require('parrot').setup {
      -- Providers must be explicitly added to make them available.
      providers = {
        anthropic = {
          api_key = os.getenv 'ANTHROPIC_API_KEY',
        },
      },
      -- Local chat buffer shortcuts
      chat_shortcut_respond = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g><C-g>' },
      chat_shortcut_delete = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g>d' },
      chat_shortcut_stop = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g>s' },
      chat_shortcut_new = { modes = { 'n', 'i', 'v', 'x' }, shortcut = '<C-g>c' },
    }
  end,
}
