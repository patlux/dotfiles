lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "sonokai"

lvim.leader = "space"
lvim.keys.visual_mode["Y"] = '"*y'

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = { "bash", "css", "dockerfile", "go", "graphql", "html", "java", "javascript", "jsdoc", "json", "json5", "jsonc", "kotlin", "lua", "nix", "python", "regex", "rust", "scss", "svelte", "typescript", "vim", "vue", "yaml", "zig" }
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.plugins = {
  {"sainnhe/sonokai"}
}

local prettier = {
  {
    exe = "prettier",
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

lvim.lang.sql.formatters = {
  {
    exe = "pg_format", -- pgFormatter
    args = {}
  }
}
