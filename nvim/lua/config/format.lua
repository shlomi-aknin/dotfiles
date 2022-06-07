local status_ok, formatter = pcall(require, 'formatter')
if not status_ok then
  return
end

local config = {
    function()
    return {
        exe = 'prettier',
        args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote', '--arrow-parents', '--config-precedence', 'prefer-file'},
        stdin = true
    }
    end
}

formatter.setup({
  filetype = {
    css = config,
    html = config,
    javascript = config,
    svelte = config,
    typescript = config,
    json = config,
  }
})
