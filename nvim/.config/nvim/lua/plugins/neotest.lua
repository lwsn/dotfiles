local function mocha_root(path)
  return vim.fs.root(path, ".mocharc.json") or vim.fs.root(path, "package.json")
end

-- .mocharc.json's `spec` glob gets merged with the file passed on the CLI, so the whole suite would run.
-- Skip the config file and pass its other options explicitly instead.
local function mocharc_args(root)
  local rc_path = root and (root .. "/.mocharc.json")
  if not rc_path or vim.fn.filereadable(rc_path) == 0 then
    return {}
  end
  local rc = vim.json.decode(table.concat(vim.fn.readfile(rc_path), "\n"))
  local args = { "--no-config" }
  for _, r in ipairs(rc.require or {}) do
    table.insert(args, "--require=" .. r)
  end
  for _, e in ipairs(rc.extension or {}) do
    table.insert(args, "--extension=" .. e)
  end
  if rc.ui then
    table.insert(args, "--ui=" .. rc.ui)
  end
  if rc.timeout then
    table.insert(args, "--timeout=" .. rc.timeout)
  end
  return args
end

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "adrigzr/neotest-mocha",
    },
    opts = function(_, opts)
      -- Mocha would time out while paused on a breakpoint, so disable the timeout for debug runs.
      local util = require("neotest-mocha.util")
      local get_strategy_config = util.get_strategy_config
      util.get_strategy_config = function(strategy, command, cwd)
        local config = get_strategy_config(strategy, command, cwd)
        if config and strategy == "dap" then
          config.args = vim.tbl_filter(function(arg)
            return not arg:match("^%-%-timeout=")
          end, config.args)
          table.insert(config.args, 1, "--timeout=0")
          config.sourceMaps = true
          config.skipFiles = { "<node_internals>/**", "**/node_modules/**" }
          config.resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" }
        end
        return config
      end

      opts.adapters = opts.adapters or {}
      opts.adapters["neotest-plenary"] = {}
      opts.adapters["neotest-mocha"] = {
        -- The backend's test/.env provides the rest of the test env.
        env = {
          NODE_ENV = "test",
          TZ = "UTC",
        },
        cwd = mocha_root,
        -- The adapter only checks the nearest node_modules, which in a workspace may lack .bin/mocha.
        command = function(path)
          return vim.fs.find("node_modules/.bin/mocha", { path = vim.fs.dirname(path), upward = true })[1] or "mocha"
        end,
        command_args = function(context)
          local args = mocharc_args(mocha_root(context.path))
          vim.list_extend(args, {
            "--full-trace",
            "--reporter=json",
            "--reporter-options=output=" .. context.results_path,
            "--grep=" .. context.test_name_pattern,
            context.path,
          })
          return args
        end,
      }
    end,
  },
}
