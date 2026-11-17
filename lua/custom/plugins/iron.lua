return {
  'Vigemus/iron.nvim',
  ft = 'python',
  keys = function()
    local function call(method, ...)
      local args = { n = select('#', ...), ... }
      return function()
        require('iron.core')[method](unpack(args, 1, args.n))
      end
    end

    local function open_split(index)
      return function()
        require('iron.state').repl_open_cmd = require('iron.config').repl_open_cmd[index]
        vim.cmd 'IronRepl'
      end
    end

    local keys = {
      { '<space>rr', '<cmd>IronRepl<cr>', desc = 'Toggle REPL' },
      { '<space>rv', open_split(1), desc = 'Open vertical REPL' },
      { '<space>rh', open_split(2), desc = 'Open horizontal REPL' },
      { '<space>rR', '<cmd>IronRestart<cr>', desc = 'Restart REPL' },
      { '<space>rF', '<cmd>IronFocus<cr>', desc = 'Focus REPL' },
      { '<space>rH', '<cmd>IronHide<cr>', desc = 'Hide REPL' },
      { '<space>rc', call('run_motion', 'send_motion'), desc = 'Send motion to REPL' },
      { '<space>rc', call('visual_send'), mode = 'x', desc = 'Send selection to REPL' },
      { '<space>rf', call('send_file'), desc = 'Send file to REPL' },
      { '<space>rl', call('send_line'), desc = 'Send line to REPL' },
      { '<space>rp', call('send_paragraph'), desc = 'Send paragraph to REPL' },
      { '<space>ru', call('send_until_cursor'), desc = 'Send through cursor to REPL' },
      { '<space>rm', call('send_mark'), desc = 'Send mark to REPL' },
      { '<space>rb', call('send_code_block', false), desc = 'Send cell to REPL' },
      { '<space>rn', call('send_code_block', true), desc = 'Send cell and advance' },
      { '<space>rM', call('run_motion', 'mark_motion'), desc = 'Mark motion for REPL' },
      { '<space>rM', call('mark_visual'), mode = 'x', desc = 'Mark selection for REPL' },
      { '<space>rd', function() require('iron.marks').drop_last() end, desc = 'Remove REPL mark' },
      { '<space>r<cr>', call('send', nil, string.char(13)), desc = 'Send newline to REPL' },
      { '<space>r<space>', call('send', nil, string.char(3)), desc = 'Interrupt REPL' },
      { '<space>rq', call('close_repl'), desc = 'Exit REPL' },
      { '<space>rC', call('send', nil, string.char(12)), desc = 'Clear REPL' },
    }
    for _, key in ipairs(keys) do
      key.ft = 'python'
      key.silent = true
    end
    return keys
  end,
  config = function()
    local iron = require 'iron.core'
    local view = require 'iron.view'
    local common = require 'iron.fts.common'

    iron.setup {
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          python = {
            command = { 'ipython', '--no-autoindent' },
            format = common.bracketed_paste_python,
            block_dividers = { '# %%', '#%%' },
          },
        },
        repl_filetype = function(_, ft)
          return ft
        end,
        repl_open_cmd = {
          view.split.vertical.rightbelow '%40', -- cmd_1: open a repl to the right
          view.split.rightbelow '%25', -- cmd_2: open a repl below
        },
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    }
  end,
}
