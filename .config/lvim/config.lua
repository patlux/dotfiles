lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "sonokai"

lvim.leader = "space"
lvim.keys.visual_mode["Y"] = '"*y'

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.plugins = {
  {"sainnhe/sonokai"}
}

local prettier = {
  {
    exe = "prettier_d_slim",
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

lvim.lang.typescript.lsp.setup.filetypes = {"typescript", "typescriptreact"}
lvim.lang.typescriptreact.lsp.setup.filetypes = {"typescript", "typescriptreact"}

lvim.lang.javascript.lsp.setup.filetypes = {"javascript", "javascriptreact", "javascript.jsx"}
lvim.lang.javascriptreact.lsp.setup.filetypes = {"javascript", "javascriptreact", "javascript.jsx"}

lvim.lang.javascript.lsp.provider = "flow"
lvim.lang.javascriptreact.lsp.provider = "flow"

lvim.lang.javascript.lsp.setup.cmd = { "npx", "--no-install", "flow", "lsp" }
lvim.lang.javascriptreact.lsp.setup.cmd = { "npx", "--no-install", "flow", "lsp" }

local lspconfig = require'lspconfig'
lvim.lang.javascriptreact.lsp.setup.root_dir = lspconfig.util.root_pattern(".flowconfig")

require'lspconfig'.flow.setup {
  cmd = lvim.lang.javascript.lsp.setup.cmd,
  root_dir = lvim.lang.javascript.lsp.setup.root_dir,
  filetypes = lvim.lang.javascript.lsp.setup.filetypes,
  formatter = lvim.lang.javascript.formatters,
  linters = lvim.lang.javascript.linters
}
