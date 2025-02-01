-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

vim.opt.complete = ""
vim.opt.title = true
-- vim.opt.titlestring = "%f - nvim"
-- vim.opt.titlestring = "%{expand('%:p') != '' ? expand('%:p') : '[No File]'} - nvim"
vim.opt.titlestring = "%{expand('%:p') != '' ? expand('%:p') : getcwd()} - nvim"

vim.g.snacks_animate = false

vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

if vim.env.SSH_TTY then
  vim.opt.clipboard:append("unnamedplus")
  local function paste()
    return vim.split(vim.fn.getreg(""), "\n")
  end
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
  }
end
