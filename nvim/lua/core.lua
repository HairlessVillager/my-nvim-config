-- 编码方式 utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- jkhl 移动时光标周围保留
vim.o.scrolloff = 4
vim.o.sidescrolloff = 8
-- 显示行号
vim.wo.number = true
-- 使用相对行号
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线
--vim.wo.colorcolumn = "80"
-- 缩进字符
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代 tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.g.python_indent = {
    open_paren = '',
    nested_paren = '',
}
vim.g.cpp_indent = {
    open_paren = '',
    nested_paren = '',
}

-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索高亮
vim.o.hlsearch = true
vim.o.incsearch = true
-- 命令模式行高
vim.o.cmdheight = 1
-- 自动加载外部修改
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = "<,>,[,]"
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示
vim.o.list = true
vim.o.listchars = "tab:>-,trail:-"
vim.o.wildmenu = true
vim.o.shortmess = vim.o.shortmess .. "c"
-- 补全显示10行
vim.o.pumheight = 10
vim.o.clipboard = "unnamedplus"

--vim.o.guifont = "Consolas Nerd Font"
--vim.o.guifont = "Consolas"
vim.opt.guifont = "Consolas:15"

vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = {
    noremap = true,
    silent = true,
}

local map = vim.api.nvim_set_keymap

-- auto complete
map("i", "(", "()<esc>i", opt)
map("i", "()", "()", opt)
map("i", "(<cr>", "()<esc>i<cr><esc>O<tab>", opt)
map("i", "(<bs>", "", opt)
map("i", "[", "[]<esc>i", opt)
map("i", "[]", "[]", opt)
map("i", "[<cr>", "[]<esc>i<cr><esc>O<tab>", opt)
map("i", "[<bs>", "", opt)
map("i", "{", "{}<esc>i", opt)
map("i", "{}", "{}", opt)
map("i", "{<cr>", "{}<esc>i<cr><esc>O<tab>", opt)
map("i", "{<bs>", "", opt)

-- NvimTree
map("n", "<leader>f", ":NvimTreeOpen<CR>", opt)

-- split
map("n", "<tab>", "<c-w>w", opt)
map("n", "<s-tab>", "<c-w>W", opt)

-- Python
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        map("n", "<leader>r", ":w<CR>:!python %", opt)
    end,
})

-- C++
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        map("n", "<leader>c", ":w<CR>:!g++ -g % -o %< -Wall", opt)
        map("n", "<leader>r", ":!%<", opt)
    end,
})

-- COQ auto start config
vim.g.coq_settings = {
    auto_start = "shut-up",
}
