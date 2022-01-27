lvim.colorscheme = "sonokai"

lvim.leader = "space"
lvim.keys.visual_mode["Y"] = '"*y'

lvim.format_on_save = true
lvim.lint_on_save = true

lvim.builtin.notify.active = true

-- --------------
-- TREESITTER ---

lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"css",
	"dockerfile",
	"go",
	"graphql",
	"html",
	"javascript",
	"jsdoc",
	"json",
	"json5",
	"lua",
	"nix",
	"python",
	"regex",
	"rust",
	"scss",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"yaml"
}
lvim.builtin.treesitter.highlight.enabled = true

-- -------
-- LSP ---

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "json", "yaml" },
  },
}

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   {
--     exe = "eslint",
--     filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "json", "yaml" },
--   },
-- }

-- https://www.lunarvim.org/languages/#multi-languages-per-formatter
-- https://github.com/LunarVim/LunarVim/issues/1705
-- lvim.lsp.on_attach_callback = function(client, _)
--   if client.name == "tsserver" or client.name == "jsonls" then
--     client.resolved_capabilities.document_formatting = false
--     client.resolved_capabilities.document_range_formatting = false
--   end
-- end

-- --------
-- Nvimtree

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_dotfiles = 0

-- -------
-- PLUGINS

lvim.plugins = {
  {"sainnhe/sonokai"},
 	{
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {"APZelos/blamer.nvim"},
  {
    "ray-x/lsp_signature.nvim",
    config = function() require"lsp_signature".on_attach() end,
    event = "BufRead"
  }
}

-- -------
-- FILETYPE

vim.cmd("au BufRead,BufNewFile Appfile set filetype=ruby")
vim.cmd("au BufRead,BufNewFile Fastfile set filetype=ruby")
vim.cmd("au BufRead,BufNewFile Matchfile set filetype=ruby")
