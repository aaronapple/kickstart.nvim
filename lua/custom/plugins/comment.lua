-- "gc" to comment visual regions/lines
return {
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = { line = '<leader>//', block = 'gbc' },
      opleader = { line = '<leader>/', block = 'gb' },
    },
  },
}
