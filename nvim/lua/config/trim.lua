local status_ok, trim = pcall(require, 'trim')
if not status_ok then
  return
end

local config = {
  disable = {},
  patterns = {
    [[%s/\s\+$//e]],
    [[%s/\($\n\s*\)\+\%$//]],
    [[%s/\%^\n\+//]],
    [[%s/\(\n\n\)\n\+/\1/]],
  },
}

trim.setup(config)
