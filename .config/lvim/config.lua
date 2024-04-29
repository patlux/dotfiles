lvim.colorscheme = "sonokai"

lvim.format_on_save = true
lvim.lint_on_save = true

vim.lsp.set_log_level("off")

-- https://www.lunarvim.org/de/docs/features/core-plugins-list
lvim.builtin.alpha.active = false
lvim.builtin.dap.active = false
lvim.builtin.project.active = false
lvim.builtin.luasnip.active = false

-- --------------
-- KEYMAPPINGS ---

lvim.leader = "space"

lvim.keys.visual_mode["Y"] = '"*y'

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

local function isFileBig(_, bufnr)
  -- Is caching necessary?
  if vim.b.big_file ~= nil then
    return vim.b.big_file
  end

  local file = vim.api.nvim_buf_get_name(bufnr)
  if not file or #file == 0 then
    vim.b.big_file = false
    return false
  end

  local max_filesize = 1024 * 1024
  local ok, stats = pcall(vim.loop.fs_stat, file)
  if ok and stats and stats.size > max_filesize then
    vim.b.big_file = true
    return true
  end

  vim.b.big_file = false
  return false
end

-- https://github.com/LunarVim/LunarVim/issues/4468
lvim.builtin.treesitter.context_commentstring = nil

-- --------------
-- TREESITTER ---

lvim.builtin.treesitter.highlight.enable = isFileBig ~= true
lvim.builtin.treesitter.matchup.disable = isFileBig
lvim.builtin.treesitter.indent.disable = isFileBig
lvim.builtin.illuminate.options.large_file_cutoff = 5000
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
  { command = "rustfmt", filetypes = { "rust" } },
  -- {
  --   exe = "biome",
  --   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "json", "yaml" },
  --   root_dir = require("null-ls.utils").root_pattern("biome.json")
  -- }
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
