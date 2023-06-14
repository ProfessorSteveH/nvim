local opt = vim.opt  --less typing

--line numbering
opt.relativenumber = true
opt.number = true

--tabs and indents
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

--line wrap
opt.wrap = false

--search
opt.ignorecase = true
opt.smartcase = true

--cursor line  (helpful in class)
opt.cursorline = true

--appearance
opt.termguicolors = true
opt.background = "light"
opt.signcolumn = "yes"

--backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

