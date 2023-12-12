local status_ok, cinnamon = pcall(require, 'cinnamon')
if not status_ok then
  return
end

cinnamon.setup({
  default_delay = 3,
  scroll_limit = -1,
})
