return function()
require"telescope".setup {
        pickers = {
            find_files = {
                find_command = {'rg', '-g'}
            }
        }
    }
end
