local cmd = vim.cmd
local opt = vim.opt
local o = vim.o
local g = vim.g

cmd("colorscheme hojicha")
opt.shortmess:append("sI")
opt.cmdheight = 0

o.number = true
o.relativenumber = true

o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true

o.mouse = "a"

o.termguicolors = true
o.signcolumn = "yes"
o.undofile = true
o.wrap = false

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
