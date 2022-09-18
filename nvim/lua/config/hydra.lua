local status_ok, hydra = pcall(require, 'hydra')
if not status_ok then
  return
end

local status_ok, splits = pcall(require, 'smart-splits')
if not status_ok then
  return
end

local cmd = require('hydra.keymap-util').cmd
local pcmd = require('hydra.keymap-util').pcmd

hydra({
   name = 'Windows',
   hint = window_hint,
   config = {
      invoke_on_body = true,
      hint = {
         border = 'rounded',
         offset = -1
      }
   },
   mode = 'n',
   body = '<C-w>',
   heads = {
      { 'h', '<C-w>h' },
      { 'j', '<C-w>j' },
      { 'k', pcmd('wincmd k', 'E11', 'close') },
      { 'l', '<C-w>l' },

      { 'H', function() splits.resize_left(2)  end },
      { 'J', function() splits.resize_down(2)  end },
      { 'K', function() splits.resize_up(2)    end },
      { 'L', function() splits.resize_right(2) end },
      { '=', '<C-w>=', { desc = 'equalize'} },

      { 's',     pcmd('split', 'E36') },
      { '<C-s>', pcmd('split', 'E36'), { desc = false } },
      { 'v',     pcmd('vsplit', 'E36') },
      { '<C-v>', pcmd('vsplit', 'E36'), { desc = false } },

      { 'w',     '<C-w>w', { exit = true, desc = false } },
      { '<C-w>', '<C-w>w', { exit = true, desc = false } },

      { 'z',     cmd 'MaximizerToggle!', { desc = 'maximize' } },
      { '<C-z>', cmd 'MaximizerToggle!', { exit = true, desc = false } },

      { 'o',     '<C-w>o', { exit = true, desc = 'remain only' } },
      { '<C-o>', '<C-w>o', { exit = true, desc = false } },

      { 'b', choose_buffer, { exit = true, desc = 'choose buffer' } },

      { 'c',     pcmd('close', 'E444') },
      { 'q',     pcmd('close', 'E444'), { desc = 'close window' } },
      { '<C-c>', pcmd('close', 'E444'), { desc = false } },
      { '<C-q>', pcmd('close', 'E444'), { desc = false } },

      { '<Esc>', nil,  { exit = true, desc = false }}
   }
})

hydra({
   name = 'Debug',
   hint = window_hint,
   config = {
      invoke_on_body = true,
      hint = {
         border = 'rounded',
         offset = -1
      }
   },
   mode = 'n',
   body = '<leader>d',
   heads = {
      { '<S-o>', ':lua require("dap").step_over()<cr>' },
      { 'a',     function() require('debugHelper').attach() end },
      { 'A',     function() require('debugHelper').attachToRemote() end },
      { 'b',     ':lua require("dap").list_breakpoints()<cr>' },
      { 'h',     ':lua require("dap.ui.widgets").hover()<cr>' },
      { 'i',     ':lua require("dap").step_into()<cr>' },
      { 'j',     function() require('jester').debug_file() end},
      { 'n',     ':lua require("dap").continue()<cr>' },
      { 'o',     ':lua require("dap").step_out()<cr>' },
      { 'p',     ':lua require("dap").list_breakpoints()<cr>' },
      { 's',     ':lua local widgets=require("dap.ui.widgets");widgets.centered_float(widgets.scopes)<cr>' },
      { 't',     ':lua require("dap").toggle_breakpoint()<cr>' },
  }
})
