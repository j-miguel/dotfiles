
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.opt.clipboard = 'unnamedplus'

vim.opt.errorbells = false
-- cmap w!! w !sudo tee % >/dev/null

-- Indentation
vim.opt.tabstop=4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Undo
-- vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- vim.opt.title = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Colors
vim.opt.termguicolors = true

-- Nav
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

vim.opt.cmdheight = 1

vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })
