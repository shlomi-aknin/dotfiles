local status_ok, tabline = pcall(require, 'tabline')
if not status_ok then
  return
end

tabline.setup({
  enable = true,
  options = {
    show_tabs_always = false,
    show_filename_only = true,
    tabline_show_bufnr = true,
    modified_icon = "[+]",
    section_separators = {'', ''},
  }
})
