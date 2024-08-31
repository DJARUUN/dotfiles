return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
    require("flash").setup({
      modes = {
        search = {
          enabled = true,
        },
        char = {
          jump_labels = true
        },
      },
    })

    local map = vim.keymap.set
    local unmap = vim.api.nvim_del_keymap

    -- Unmap existing keymaps for 'f' and 'F'
    unmap("n", "f")
    unmap("n", "F")

    -- Map 'f' and 'F' keys for normal, visual, and operator modes
    map({ "n", "x", "o" }, "f", function()
      require("flash").jump({ search = { forward = true, wrap = false, multi_window = false } })
    end, { desc = "Flash" })

    map({ "n", "x", "o" }, "F", function()
      require("flash").jump({ search = { forward = false, wrap = false, multi_window = false } })
    end, { desc = "Flash Backwards" })
  end,
}
