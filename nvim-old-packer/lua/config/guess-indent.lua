local status_ok, guessIndent = pcall(require, 'guess-indent')
if not status_ok then
  return
end

guessIndent.setup({})
