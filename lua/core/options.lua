local opt = vim.opt

-- Line number
opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.cursorline = true

opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true
opt.signcolumn = "yes"
