return function()
  local c = require'Comment'
  c.setup {
    opleader = {
      line = '<C-/>', 
      block = '<C-S-/>',
    }, 
    mappings = {
     extra = false
    }
  }
end
