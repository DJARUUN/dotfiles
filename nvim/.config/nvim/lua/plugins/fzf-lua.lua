return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "<leader>sf", function() require("fzf-lua").files() end, { silent = true } },
    { "<leader>sr", function() require("fzf-lua").resume() end, { silent = true } },
    { "<leader><leader>", function() require("fzf-lua").buffers() end, { silent = true } },
    { "<leader>sg", function() require("fzf-lua").grep_project() end, { silent = true } },
    { "<leader>sd", function() require("fzf-lua").diagnostics_workspace() end, { silent = true } },
    { "<leader>s.", function() require("fzf-lua").oldfiles() end, { silent = true } },
    { "<leader>sn", function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end, { silent = true } },
    { "<C-x><C-f>", function() require("fzf-lua").complete_path() end, { silent = true } }
  },
  config = function()
    require("fzf-lua").setup({
      "ivy",
      keymap = {
        builtin = {
          true,
          ["<C-e>"] = "preview-page-up",
          ["<C-d>"] = "preview-page-down",
        },
        fzf = {
          true,
          ["ctrl-q"] = "select-all+accept",
        },
      },
      defaults = {
        formatter = "path.filename_first",
      },
      files = {
        follow = true,
      },
    })
  end,
}
