-- load Lazy plugin manager
require("config.lazy")

--vim.opt.numbers = true
--vim.opt.relativenumber = true
--vim.opt.statuscolumn = "%s %1 %r "

--vim.cmd([[ 
--if wo.number or wo.relativenumber then
--linenr = "%=" .. vim.v.lnum .. " %=" .. vim.v.relnum .. " "
--table.insert(components, linenr)
--end 
--]])

--vim.opt.statuscolumn ='"%s%<%2l%>|" .. vim.v.relnum .. "%=" .. get_fold(vim.v.lnum)'

--vim.opt.statuscolumn = "%s %{v:relnum} %{v:lnum}"

-- smoler tabs
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")

-- disable arrow keys
vim.cmd("map <Up> <Nop>")
vim.cmd("map <Left> <Nop>")
vim.cmd("map <Right> <Nop>")
vim.cmd("map <Down> <Nop>")
