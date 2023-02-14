local status_ok, hydra = pcall(require, 'hydra')
if not status_ok then
  return
end

local status_ok, splits = pcall(require, 'smart-splits')
if not status_ok then
  return
end

local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return
end

local dapui = require('dap.ui.widgets')

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
  hint = hint,
  config = {
    color = 'pink',
    invoke_on_body = true,
    hint = {
      type = 'window'
    },
  },
  mode = { 'n' },
  body = '<leader>d',
  heads = {
    { 'H', dapui.hover,{ desc = 'hover' } },
    { 'K', function() dapui.centered_float(dapui.scopes) end,{ desc = 'scopes' } },
    { 'L', dap.list_breakpoints,{ desc = 'list breakpoints' } },
    { 'c', dap.run_to_cursor,{ desc = 'run to cursor' } },
    { 'h', dap.step_out,{ desc = 'step out' } },
    { 'j', dap.continue, { desc = 'continue' } },
    { 'k', dap.step_over, { desc = 'step over' } },
    { 'l', dap.step_into, { desc = 'step into' } },
    { 't', dap.toggle_breakpoint, { desc = 'toggle breakpoint' } },
    { 'T', dap.clear_breakpoints, { desc = 'clear breakpoints' } },
    { 'x', dap.terminate, { desc = 'terminate' } },
    { 'r', dap.repl.open, { exit = true, desc = 'open repl' } },
    { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
    { '<esc>', nil, { exit = true, nowait = true, desc = 'exit' } },
  }
})
