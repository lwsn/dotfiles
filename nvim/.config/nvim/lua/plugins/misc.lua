local supported = {
  "astro",
  "css",
  "graphql",
  -- "html",
  "javascript",
  "javascriptreact",
  "json",
  "jsonc",
  -- "markdown",
  "svelte",
  "typescript",
  "typescriptreact",
  "vue",
  -- "yaml",
}

return {
  {
    "stevearc/conform.nvim",
    optional = true,
    ---@param opts ConformOpts
    opts = function(_, opts)
      opts.log_level = vim.log.levels.DEBUG
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs(supported) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], "biome")
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.biome = {
        require_cwd = true,
      }
    end,
  },

  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      indent = {
        enabled = false,
      },
      explorer = {
        enabled = false,
      },
    },
  },
  {
    "nvim-mini/mini.files",
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
  {
    "mluders/comfy-line-numbers.nvim",
    enabled = false,
    opts = {
      labels = {
        "1",
        "2",
        "3",
        "4",
        "5",
        "11",
        "12",
        "13",
        "14",
        "15",
        "21",
        "22",
        "23",
        "24",
        "25",
        "31",
        "32",
        "33",
        "34",
        "35",
        "41",
        "42",
        "43",
        "44",
        "45",
        "51",
        "52",
        "53",
        "54",
        "55",
        "111",
        "112",
        "113",
        "114",
        "115",
        "121",
        "122",
        "123",
        "124",
        "125",
        "131",
        "132",
        "133",
        "134",
        "135",
        "141",
        "142",
        "143",
        "144",
        "145",
        "151",
        "152",
        "153",
        "154",
        "155",
        "211",
        "212",
        "213",
        "214",
        "215",
        "221",
        "222",
        "223",
        "224",
        "225",
        "231",
        "232",
        "233",
        "234",
        "235",
        "241",
        "242",
        "243",
        "244",
        "245",
        "251",
        "252",
        "253",
        "254",
        "255",
      },
      up_key = "k",
      down_key = "j",
    },
  },
}
