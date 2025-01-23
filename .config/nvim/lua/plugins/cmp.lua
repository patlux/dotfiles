local cmp = require("cmp")

return {
  "hrsh7th/nvim-cmp",
  opts = {
    mapping = cmp.mapping.preset.insert({
      ["<C-d>"] = cmp.mapping.complete(),
    }),
  },
}
