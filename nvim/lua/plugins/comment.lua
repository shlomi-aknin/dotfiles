return {
    'terrortylor/nvim-comment',
    opts = {},
    config = function ()
      require('nvim_comment').setup({comment_empty = false})
    end
}
