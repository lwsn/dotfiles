return {
  {
    "Saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },
      -- {
      --   sources = {
      --     providers = {
      --       path = {
      --         enabled = function()
      --           return vim.bo.filetype ~= "copilot-chat"
      --         end,
      --       },
      --     },
      --   },
      -- },
      -- maybe optional
      -- completion = { list = { selection = "auto_insert" } },
    },
  },
}
