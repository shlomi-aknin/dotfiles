local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.smart_shift_tab()
    return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
end

