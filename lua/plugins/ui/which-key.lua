---@type LazySpec
-- NOTE: Keymaps UI
return {
  "folke/which-key.nvim",
  opts = {
    preset = "modern",
    show_help = true,
    spec = {
      { "<leader>h", group = "Harpoon", desc = "save list" },
    },
    win = {
      no_overlap = false,
    },
  },
}
