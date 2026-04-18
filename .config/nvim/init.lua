-- Load Lazy Pluging Manager
require("config.lazy")

-- make the line you are in more visible
vim.cmd("set cursorline")

-- smoler tabs
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")

-- set relative line numbers for easier vim motions
vim.cmd("set relativenumber")
vim.cmd("set number")

-- disable arrow keys in normal mode
--vim.cmd("map <Up> <Nop>")
--vim.cmd("map <Left> <Nop>")
--vim.cmd("map <Right> <Nop>")
--vim.cmd("map <Down> <Nop>")
