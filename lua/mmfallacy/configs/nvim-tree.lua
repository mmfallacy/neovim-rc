return function()
    require 'nvim-tree'.setup {
        auto_reload_on_write = false,
        update_cwd = true,
        hijack_cursor = true,
        renderer = {
            add_trailing = true,
            group_empty = true,
            indent_markers = { enable = true },
            icons = {
                show = {
                    file = false,
                    folder = false,
                    folder_arrow = false,
                    git = false,
                    modified = false,
                },
            },
        },
        git = { ignore = true },
        view = {
            side = 'right',
            mappings = {
                list = {
                    { key = "<C-o>", action = nil, mode = "n" },
                    { key = "<C-p>", action = nil, mode = "n" }
                }
            }
        },
    }

end
