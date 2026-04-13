local dap = require "dap"

-- JavaScript / TypeScript
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "js-debug-adapter",
    args = { "${port}" },
  },
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

vim.fn.sign_define("DapBreakpoint", {
  text = "🔴",
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapBreakpointCondition", {
  text = "🟡",
  texthl = "DapBreakpointCondition",
})

vim.fn.sign_define("DapLogPoint", {
  text = "🔵",
  texthl = "DapLogPoint",
})

vim.fn.sign_define("DapStopped", {
  text = "👉",
  texthl = "DapStopped",
  linehl = "Visual",
  numhl = "DapStopped",
})
