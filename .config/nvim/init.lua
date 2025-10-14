-- Load Lazy Pluging Manager
require("config.lazy")

-- smoler tabs
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")

-- disable arrow keys in normal mode
vim.cmd("map <Up> <Nop>")
vim.cmd("map <Left> <Nop>")
vim.cmd("map <Right> <Nop>")
vim.cmd("map <Down> <Nop>")
