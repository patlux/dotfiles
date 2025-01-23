return {
  "saghen/blink.cmp", -- Ensure the plugin is listed
  opts = {
    signature = { enabled = true },
    completion = {
      keyword = { range = "full" },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      ghost_text = { enabled = true },
    },
  },
  --
  --     -- trigger = {
  --     --   show_on_trigger_character = false,
  --     -- },
  --     menu = {
  --       -- Don't automatically show the completion menu
  --       -- auto_show = true,
  --
  --       -- nvim-cmp style menu
  --       -- draw = {
  --       --   columns = {
  --       --     { "label", "label_description", gap = 1 },
  --       --     { "kind_icon", "kind" },
  --       --   },
  --       -- },
  --       --
  --       draw = {
  --         -- We don't need label_description now because label and label_description are already
  --         -- conbined together in label by colorful-menu.nvim.
  --         --
  --         -- However, for `basedpyright`, it is recommend to set
  --         -- columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
  --         -- because the `label_description` will only be import path.
  --         columns = { { "kind_icon" }, { "label", gap = 1 } },
  --         components = {
  --           label = {
  --             text = require("colorful-menu").blink_components_text,
  --             highlight = require("colorful-menu").blink_components_highlight,
  --           },
  --         },
  --       },
  --     },
  --   },
  --   -- sources = {
  --   --   default = { "lsp", "path", "buffer" },
  --   -- },
  -- },
  -- config = function(_, opts)
  --   opts.sources.transform_items = function(_, items)
  --     return vim.tbl_filter(function(item)
  --       return item.kind ~= require("blink.cmp.types").CompletionItemKind.Snippet
  --     end, items)
  --   end
  -- end,
}
