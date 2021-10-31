lvim.colorscheme = "sonokai"

lvim.leader = "space"
lvim.keys.visual_mode["Y"] = '"*y'

lvim.format_on_save = true
lvim.lint_on_save = true

-- --------------
-- TREESITTER ---

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- -------
-- LSP ---

local prettier = {
  {
    exe = "prettierd",
    args = {}
  }
}

local eslint_d = {
  {
    exe = "eslint_d",
    args = {}
  }
}

lvim.lang.javascript.formatters = prettier
lvim.lang.javascriptreact.linters = eslint_d
lvim.lang.typescript.formatters = prettier
lvim.lang.typescript.linters = eslint_d
lvim.lang.typescriptreact.formatters = prettier
lvim.lang.typescriptreact.linters = eslint_d
lvim.lang.css.formatters = prettier
lvim.lang.json.formatters = prettier
lvim.lang.yaml.formatters = prettier

-- lvim.lang.sql.formatters = {
--   {
--     exe = "pg_format", -- pgFormatter
--     args = {}
--   }
-- }

-- https://www.lunarvim.org/languages/#multi-languages-per-formatter
-- https://github.com/LunarVim/LunarVim/issues/1705
lvim.lsp.on_attach_callback = function(client, _)
  if client.name == "tsserver" or client.name == "jsonls" then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

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
}
