lvim.colorscheme = "sonokai"

lvim.format_on_save = true
lvim.lint_on_save = true

vim.lsp.set_log_level("off")

-- https://www.lunarvim.org/de/docs/features/core-plugins-list
lvim.builtin.alpha.active = false
lvim.builtin.dap.active = false
lvim.builtin.project.active = false
lvim.builtin.luasnip.active = false

lvim.lsp.installer.setup.automatic_installation = false

-- --------------
-- KEYMAPPINGS ---

lvim.leader = "space"

lvim.keys.visual_mode["Y"] = '"*y'

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- --------------
-- TREESITTER ---

lvim.builtin.treesitter.highlight.enable = true
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
  "kotlin",
  "mermaid",
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
  "yaml",
  "zig"
}

-- -------
-- LSP ---

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local nls = require "null-ls"
local b = nls.builtins

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- {
  --   exe = "prettier",
  --   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "json", "yaml" },
  --   root_dir = require("null-ls.utils").root_pattern(".prettierrc")
  -- },
  b.formatting.prettier,
  {
    exe = "biome",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "json", "yaml" },
    root_dir = require("null-ls.utils").root_pattern("biome.json")
  }
  -- with_root_file(b.formatting.prettier, { "node_modules/.bin/prettier" }),
  -- with_root_file(b.formatting.rome.with { filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact",
  --   "css", "json", "yaml" } }, { "node_modules/.bin/rome" }),
  -- with_root_file(b.formatting.gofmt, { "go.mod" })
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
  with_root_file(b.code_actions.eslint, { ".eslintrc" }),
  -- with_root_file(b.diagnostics.golangci_lint, { "go.mod" }),
}

-- --------
-- Nvimtree

lvim.builtin.nvimtree.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_dotfiles = 0

-- -------
-- PLUGINS

lvim.plugins = {
  { "sainnhe/sonokai" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  { "APZelos/blamer.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    config = function() require "lsp_signature".on_attach() end,
    event = "BufRead"
  },
  { "isobit/vim-caddyfile", lazy = true },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "David-Kunz/gen.nvim",
    config = function()
      -- require('gen').container = 'ollama_gpu'
      require('gen').model = 'codellama'
    end
  }
}

local api = require("typescript-tools.api")
require('typescript-tools').setup {
  handlers = {
    ["textDocument/publishDiagnostics"] = api.filter_diagnostics(
    -- Ignore 'File is a CommonJS module; it may be converted to an ES6 module' diagnostics.
      { 80001 }
    ),
  },
  settings = {
    tsserver_path = nil,
  }
}


-- -------
-- gen

-- require('gen').prompts['Fix_Code'] = {
--   prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
--   replace = true,
--   extract = "```$filetype\n(.-)```"
-- }

-- -------
-- TELESCOPE

lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "%.app/",
  "build/",
  "dist/"
}

-- -------
-- FILETYPE

vim.cmd("au BufRead,BufNewFile Appfile set filetype=ruby")
vim.cmd("au BufRead,BufNewFile Fastfile set filetype=ruby")
vim.cmd("au BufRead,BufNewFile Matchfile set filetype=ruby")
vim.cmd("au BufRead,BufNewFile *.podspec set syntax=ruby")
vim.cmd("au BufRead,BufNewFile *.gradle set syntax=groovy")
vim.cmd("au BufRead,BufNewFile *.zig set ft=zig")
vim.cmd("au BufRead,BufNewFile *.kt set syntax=kotlin")
