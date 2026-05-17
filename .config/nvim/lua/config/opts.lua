-- make the line you are in more visible
vim.opt.cursorline = true
--vim.cmd("set cursorline")

-- smoler tabs
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
--vim.cmd("set shiftwidth=2")
--vim.cmd("set tabstop=2")

-- set relative line numbers for easier vim motions
--vim.opt.number = true
--vim.opt.relativenumber = true
--vim.cmd("set relativenumber")
--vim.cmd("set number")

-- disable arrow keys in normal mode
vim.cmd("map <Up> <Nop>")
vim.cmd("map <Left> <Nop>")
vim.cmd("map <Right> <Nop>")
vim.cmd("map <Down> <Nop>")

-- display nothing instead of ~ at end of files/buffers
vim.opt.fillchars = { eob = " " }
