return {
    'akinsho/bufferline.nvim',
    enabled = false,
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
        local bufferline = require('bufferline')
        bufferline.setup({
            options = {
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                style_preset = bufferline.style_preset.default,
                themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = 'icon',
                },
                max_name_length = 30,
                truncate_names = false, -- whether or not tab names should be truncated
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false, -- only applies to coc
                diagnostics_update_on_event = true, -- use nvim's diagnostic handler
                -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
                offsets = {
                    {
                        filetype = "oil",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true
                    }
                },
                color_icons = true, -- whether or not to add the filetype icon highlights
                show_buffer_icons = true, -- disable filetype icons for buffers
                show_buffer_close_icons = false,
                show_close_icon = false,
                show_tab_indicators = true,
                show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
                duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
                -- can also be a table containing 2 custom separators
                -- [focused and unfocused]. eg: { '|', '|' }
                separator_style = "thick",
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                auto_toggle_bufferline = true,
            }
        })
    end
}
