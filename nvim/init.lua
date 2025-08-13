vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wildmenu = true
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.encoding = "utf-8"
vim.opt.backspace = "indent,eol,start"
vim.opt.hidden = true
vim.opt.showbreak = " "
vim.opt.wildmode = "longest,full"
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.pack.add({
  { src = "https://github.com/rose-pine/neovim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/echasnovski/mini.pairs" },
  { src = "https://github.com/rebelot/kanagawa.nvim" },
  { src = "https://github.com/echasnovski/mini.align" },
  { src = "https://github.com/echasnovski/mini.surround" },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
vim.cmd("set completeopt+=noselect")

vim.lsp.enable({ 'lua_ls', 'rust_analyzer', 'clangd'})

vim.keymap.set({ 'n', 'v' }, 'j', 'gj')
vim.keymap.set({ 'n', 'v' }, 'k', 'gk')
vim.keymap.set('n', '<CR>j', 'o<ESC>')
vim.keymap.set('n', '<CR>k', 'O<ESC>')

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")

require 'mini.pick'.setup()
require 'mini.pairs'.setup()
require 'mini.align'.setup()
require 'mini.surround'.setup()

require "nvim-treesitter.configs".setup({
  ensure_installed = { "c", "bash", "vim", "lua", "rust" },
  highlight = { enable = true }
})
require "oil".setup({
  keymaps = {
    ["<C-[>"] = { "actions.close", mode = "n" },
  },
})

vim.diagnostic.config({
  signs = {
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
})

-- vim.cmd("colorscheme rose-pine-moon")
vim.cmd("colorscheme kanagawa-wave")
vim.cmd(":hi statusline guibg=NONE")
