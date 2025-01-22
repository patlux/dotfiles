-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

map("n", "<leader>xj", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "<leader>xk", diagnostic_goto(false), { desc = "Prev Diagnostic" })

-- local telescope = require("telescope.builtin")
-- map("n", "<leader>si", function()
--   telescope.live_grep({
--     additional_args = function()
--       return { "--no-ignore" }
--     end,
--   })
-- end, { desc = "Live grep for all files" })
-- map("n", "<leader>fi", function()
--   telescope.find_files({
--     no_ignore = true, -- Include ignored files
--     hidden = true, -- Optionally include hidden files
--   })
-- end, { desc = "Find all files" })
