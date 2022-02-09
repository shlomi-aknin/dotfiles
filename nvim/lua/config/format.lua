local config = {
    function()
    return {
        exe = 'prettier',
        args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote', '--arrow-parents'},
        stdin = true
    }
    end
}

require('formatter').setup({
  filetype = {
    css = config,
    html = config,
    javascript = config,
    svelte = config,
  }
})