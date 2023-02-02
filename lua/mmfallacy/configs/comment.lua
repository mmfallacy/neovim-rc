return function()
  local c = require'Comment'
  c.setup {
    toggler = {
      line = '<C-/>',
      block = '<C-S-/>',
    },
    mappings = {
     extra = false
    }
  }
end
