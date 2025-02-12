return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      indent = {
        enabled = false,
      },
    },
  },
  {
    "echasnovski/mini.files",
    opts = {},
    keys = {
      {
        "<leader>F",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
      },
    },
  },
}
