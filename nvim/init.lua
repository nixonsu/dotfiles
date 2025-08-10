------------------------------PLUGINS------------------------------
vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim.git" },
	{ src = "https://github.com/echasnovski/mini.pick.git" },
	{ src = "https://github.com/stevearc/oil.nvim.git" },
	{ src = "https://github.com/neovim/nvim-lspconfig.git" },
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git" }
})

require("oil").setup()
require("mini.pick").setup()
require("mason").setup()
vim.lsp.enable({ "lua_ls" })
-- Fix lua warnings related to vim table
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
})

require("nvim-treesitter.configs").setup {
	ensure_installed = { "lua" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	modules = {},
	ignore_install = {}
}
------------------------------PLUGINS-------------------------------

------------------------------SETTINGS------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
vim.opt.scrolloff = 12

vim.opt.winborder = "rounded"

vim.cmd.colorscheme("catppuccin-mocha")

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.cmd(":hi statusline guibg=NONE")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
------------------------------SETTINGS-----------------------------

------------------------------KEYMAPS------------------------------
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit!<CR>")
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- Go to previous file
vim.keymap.set("n", "<leader>a", ":e #<CR>")

-- Open file in vertical split
vim.keymap.set("n", "<leader>v", ":vs<CR>")

-- Open previous file in vertical split
vim.keymap.set("n", "<leader>av", ":vs #<CR>")

-- Go to next split
vim.keymap.set("n", "<leader><Tab>", "<C-w>w")

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y')

-- Move selected code block up
vim.keymap.set("v", "K", ':m "<-2<CR>gv=gv', { silent = true })

-- Move selected code block down
vim.keymap.set("v", "J", ':m ">+1<CR>gv=gv', { silent = true })

-- Auto center after jumps
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Escape to exit highlight mode
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })

-- Toggle relative line numbers
vim.keymap.set("n", "<leader>ln", ":set invrelativenumber<CR>", { silent = true })

-- Pickers
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")

------------------------------KEYMAPS------------------------------
