local status_ok, close_buffers = pcall(require, 'close_buffers')
if not status_ok then
  return
end

close_buffers.setup({
  preserve_window_layout = { 'this', 'nameless' },
})
