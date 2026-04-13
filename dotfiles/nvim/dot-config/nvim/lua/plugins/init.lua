return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "bash",
        "json",
        "c_sharp",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
    },
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require "configs.mason_nvim_dap"
    end,
    dependencies = {
      "mason-org/mason.nvim",
      "mfussenegger/nvim-dap",
    },
  },

  {
    "danymat/neogen",
    opts = {},
    cmd = "Neogen",
    keys = {
      {
        "<leader>ca",
        function()
          require("neogen").generate()
        end,
        desc = "Generate annotation",
      },
    },
  },
}
