local status_ok, indent = pcall(require, 'indent-o-matic')
if not status_ok then
  return
end

indent.setup({})
