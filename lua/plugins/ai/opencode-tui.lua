---@type LazySpec
-- NOTE:  Opencode-TUI
return {
  "NickvanDyke/opencode.nvim",
  enabled = true,
  name = "opencode-tui.nvim",
  event = "VeryLazy",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`
    }
    vim.o.autoread = true

    -- Recommended/example keymaps
    vim.keymap.set({ "n", "x" }, "<leader>aa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask about this" })
    vim.keymap.set({ "n", "x" }, "<leader>a+", function()
      require("opencode").prompt("@this")
    end, { desc = "Add this" })
    vim.keymap.set({ "n", "x" }, "<leader>as", function()
      require("opencode").select()
    end, { desc = "Select prompt" })
    vim.keymap.set("n", "<leader>at", function()
      require("opencode").toggle()
    end, { desc = "Toggle embedded" })
    vim.keymap.set("n", "<leader>ac", function()
      require("opencode").command()
    end, { desc = "Select command" })
    vim.keymap.set("n", "<leader>an", function()
      require("opencode").command("session_new")
    end, { desc = "New session" })
    vim.keymap.set("n", "<leader>ai", function()
      require("opencode").command("session_interrupt")
    end, { desc = "Interrupt session" })
    vim.keymap.set("n", "<leader>aA", function()
      require("opencode").command("agent_cycle")
    end, { desc = "Cycle selected agent" })
    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command("messages_half_page_up")
    end, { desc = "Messages half page up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command("messages_half_page_down")
    end, { desc = "Messages half page down" })
  end,
}
