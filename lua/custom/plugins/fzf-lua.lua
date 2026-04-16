return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  dependencies = { 'nvim-mini/mini.icons' },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {
    preview = {
      default = 'bat',
    },
  },
  ---@diagnostic enable: missing-fields
  config = function()
    require('fzf-lua').setup { 'telescope' }
  end,
  keys = {
    {
      '<leader><leader>',
      mode = { 'n' },
      function()
        require('fzf-lua').buffers()
      end,
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>/',
      mode = { 'n' },
      function()
        require('fzf-lua').grep_curbuf()
      end,
      desc = '[ ]/ Grep in current buffer',
    },
    {
      '<leader>sf',
      mode = { 'n' },
      function()
        require('fzf-lua').files()
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>s/',
      mode = { 'n' },
      function()
        require('fzf-lua').grep()
      end,
      desc = '[S]earch [/] in Open Files',
    },
    {
      '<leader>sh',
      mode = { 'n' },
      function()
        require('fzf-lua').helptags()
      end,
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sm',
      mode = { 'n' },
      function()
        require('fzf-lua').keymaps()
      end,
      desc = '[S]earch [K]eymaps',
    },
    {
      '<leader>ss',
      mode = { 'n' },
      function()
        require('fzf-lua').builtin()
      end,
      desc = '[S]earch [S]elect Telescope',
    },
    {
      '<leader>sw',
      mode = { 'n' },
      function()
        require('fzf-lua').grep_cword()
      end,
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>sg',
      mode = { 'n' },
      function()
        require('fzf-lua').grep()
      end,
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>sd',
      mode = { 'n' },
      function()
        require('fzf-lua').diagnostics_workspace()
      end,
      desc = '[S]earch [D]iagnostics',
    },
    {
      '<leader>sr',
      mode = { 'n' },
      function()
        require('fzf-lua').resume()
      end,
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>s.',
      mode = { 'n' },
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = '[S]earch Recent Files ("." for repeat)',
    },
  },
}
