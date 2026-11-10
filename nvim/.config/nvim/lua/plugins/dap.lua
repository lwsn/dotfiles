local function package_root()
  return vim.fs.root(0, "package.json") or vim.fn.getcwd()
end

return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      local common = {
        type = "pwa-node",
        sourceMaps = true,
        skipFiles = { "<node_internals>/**", "**/node_modules/**" },
        resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
      }

      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        dap.configurations[language] = {
          vim.tbl_extend("force", common, {
            request = "launch",
            name = "Launch file (swc)",
            program = "${file}",
            cwd = package_root,
            runtimeArgs = { "--require", "@swc-node/register", "--require", "tsconfig-paths/register" },
            console = "integratedTerminal",
          }),
          vim.tbl_extend("force", common, {
            request = "attach",
            name = "Attach to port",
            port = function()
              return tonumber(vim.fn.input("Port: ", "9229"))
            end,
            cwd = "${workspaceFolder}",
          }),
          vim.tbl_extend("force", common, {
            request = "attach",
            name = "Attach to process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          }),
        }
      end
    end,
  },
}
