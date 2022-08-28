local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require('telescope.actions')
local transform_mod = require('telescope.actions.mt').transform_mod
local action_state = require('telescope.actions.state')
local action_layout = require('telescope.actions.layout')

require('plenary.filetype').add_file('svelte')

local open_filtered = function(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local manager = picker.manager
  for entry in manager:iter() do
    vim.cmd(string.format('%s +%s %s', ':find!', entry.lnum, entry.filename))
    vim.cmd('set number')
    vim.cmd('set relativenumber')
    vim.cmd('set cursorline')
  end
  vim.cmd('stopinsert')
end

local function multiopen(prompt_bufnr, method)
    local edit_file_cmd_map = {
        vertical = "vsplit",
        horizontal = "split",
        tab = "tabedit",
        default = "edit",
    }
    local edit_buf_cmd_map = {
        vertical = "vert sbuffer",
        horizontal = "sbuffer",
        tab = "tab sbuffer",
        default = "buffer",
    }
    local picker = action_state.get_current_picker(prompt_bufnr)
    local multi_selection = picker:get_multi_selection()

    if #multi_selection > 1 then
        require("telescope.pickers").on_close_prompt(prompt_bufnr)
        pcall(vim.api.nvim_set_current_win, picker.original_win_id)

        for i, entry in ipairs(multi_selection) do
            local filename, row, col

            if entry.path or entry.filename then
                filename = entry.path or entry.filename

                row = entry.row or entry.lnum
                col = vim.F.if_nil(entry.col, 1)
            elseif not entry.bufnr then
                local value = entry.value
                if not value then
                    return
                end

                if type(value) == "table" then
                    value = entry.display
                end

                local sections = vim.split(value, ":")

                filename = sections[1]
                row = tonumber(sections[2])
                col = tonumber(sections[3])
            end

            local entry_bufnr = entry.bufnr

            if entry_bufnr then
                if not vim.api.nvim_buf_get_option(entry_bufnr, "buflisted") then
                    vim.api.nvim_buf_set_option(entry_bufnr, "buflisted", true)
                end
                local command = i == 1 and "buffer" or edit_buf_cmd_map[method]
                pcall(vim.cmd, string.format("%s %s", command, vim.api.nvim_buf_get_name(entry_bufnr)))
            else
                local command = i == 1 and "edit" or edit_file_cmd_map[method]
                if vim.api.nvim_buf_get_name(0) ~= filename or command ~= "edit" then
                    filename = require("plenary.path"):new(vim.fn.fnameescape(filename)):normalize(vim.loop.cwd())
                    pcall(vim.cmd, string.format("%s %s", command, filename))
                end
            end

            if row and col then
                pcall(vim.api.nvim_win_set_cursor, 0, { row, col-1 })
            end
        end
    else
        actions["select_" .. method](prompt_bufnr)
    end
end

local custom_actions = transform_mod({
    multi_selection_open_vertical = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'vertical')
    end,
    multi_selection_open_horizontal = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'horizontal')
    end,
    multi_selection_open_tab = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'tab')
    end,
    multi_selection_open = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'default')
    end,
})

local function stopinsert(callback)
    return function(prompt_bufnr)
        vim.cmd.stopinsert()
        vim.schedule(function()
            callback(prompt_bufnr)
        end)
    end
end

local multi_open_mappings = {
    i = {
        ['<C-h>'] = action_layout.toggle_preview,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-l>']  = stopinsert(custom_actions.multi_selection_open),
        ['<C-v>'] = stopinsert(custom_actions.multi_selection_open_vertical),
        ['<C-s>'] = stopinsert(custom_actions.multi_selection_open_horizontal),
        ['<C-t>'] = stopinsert(custom_actions.multi_selection_open_tab),
        ['<CR>']  = stopinsert(custom_actions.multi_selection_open)
    },
    n = {
        ['<C-h>'] = action_layout.toggle_preview,
        ['<C-c>'] = actions.close,
        ['<C-l>'] = custom_actions.multi_selection_open,
        ['<C-v>'] = custom_actions.multi_selection_open_vertical,
        ['<C-s>'] = custom_actions.multi_selection_open_horizontal,
        ['<C-t>'] = custom_actions.multi_selection_open_tab,
        ['<CR>'] = custom_actions.multi_selection_open,
    },
}

function yank_file()
  local entry = action_state.get_selected_entry()
  copy_to_clipboard(entry.path)
end

function copy_to_clipboard(content)
  vim.fn.setreg('+', content);
  vim.fn.setreg('"', content);
  return print(string.format('Copied %s to system clipboard! \n', content))
end

telescope.setup({
  defaults = {
    preview = {
      hide_on_startup = true,
    },
    prompt_prefix = '~> ',
    layout_config = {
      preview_width = 0.6
    },
    file_ignore_patterns = { 'node_modules', '.git', 'package-lock.json' },
    mappings = multi_open_mappings
  }
})

telescope.load_extension('file_browser')
