return function()
    local c = require'mini.comment'
    c.setup {
        mappings = {
            comment = '<C-/>',
            comment_line = '<C-/>',
            textobject = '<C-/>',
        }
    } 
end
