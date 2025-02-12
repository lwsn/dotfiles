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
    },
  },
}
