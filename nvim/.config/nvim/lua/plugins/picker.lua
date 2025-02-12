return {
  {
    "folke/snacks.nvim",
    --@type snacks.Config
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
          },
        },
      },
    },
    keys = {
      { "<leader><space>", LazyVim.pick("files", { hidden = true }), desc = "Find Files (Lol)" },
      {
        "<leader><tab>",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>R",
        LazyVim.pick("oldfiles"),
        desc = "Recent Files",
      },
      {
        "<leader>r",
        function()
          Snacks.picker.recent({ filter = { cwd = true } })
        end,
        desc = "Recent Files (Root)",
      },
    },
  },
}
