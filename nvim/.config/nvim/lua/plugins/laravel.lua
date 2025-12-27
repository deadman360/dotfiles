return {
  -- Treesitter para PHP
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "php",
        "phpdoc",
        "blade",
        "html",
        "css",
        "javascript",
        "sql",
      })
    end,
  },

  -- Mason: Gerenciador de LSP, DAP, Linters e Formatters
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- LSP
        "intelephense", -- LSP principal para PHP
        "blade-formatter", -- Formatador Blade
        "phpactor", -- LSP alternativo (opcional)

        -- Linters

        -- Formatters
        "php-cs-fixer", -- Formatador PSR
        "pint", -- Formatador Laravel

        -- Debug
        "php-debug-adapter", -- DAP para debugging
      })
    end,
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Intelephense (LSP Principal)
        intelephense = {
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000,
                associations = { "*.php", "*.phtml", "*.blade.php" },
                exclude = {
                  "**/.git/**",
                  "**/.svn/**",
                  "**/.hg/**",
                  "**/CVS/**",
                  "**/.DS_Store/**",
                  "**/node_modules/**",
                  "**/bower_components/**",
                  "**/vendor/**/{Tests,tests}/**",
                  "**/.history/**",
                  "**/vendor/**/vendor/**",
                },
              },
              stubs = {
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "Core",
                "ctype",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "exif",
                "FFI",
                "fileinfo",
                "filter",
                "fpm",
                "ftp",
                "gd",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "meta",
                "mysqli",
                "oci8",
                "odbc",
                "openssl",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_ibm",
                "pdo_mysql",
                "pdo_pgsql",
                "pdo_sqlite",
                "pgsql",
                "Phar",
                "posix",
                "pspell",
                "readline",
                "Reflection",
                "session",
                "shmop",
                "SimpleXML",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "sqlite3",
                "standard",
                "superglobals",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "Zend OPcache",
                "zip",
                "zlib",
                -- Laravel
                "laravel",
              },
              environment = {
                includePaths = {
                  "/home/deadman360/.config/composer/vendor/",
                },
              },
              format = {
                enable = true,
              },
              -- CRÍTICO: Habilita indexação de vendor
              completion = {
                insertUseDeclaration = true,
                fullyQualifyGlobalConstantsAndFunctions = false,
                triggerParameterHints = true,
                maxItems = 100,
              },
              -- Habilita indexação completa incluindo vendor
              indexingOptions = {
                includePatterns = { "**/*.php" },
              },
            },
          },
        },

        -- PHPActor (Alternativo/Complementar)
        phpactor = {
          filetypes = { "php", "blade" },
          settings = {
            phpactor = {
              language_server = {
                diagnostics_on_update = false,
              },
            },
          },
        },
      },
    },
  },

  -- Conform.nvim (Formatação)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "php_cs_fixer" }, -- ou "pint" para projetos Laravel
        blade = { "blade-formatter" },
      },
      formatters = {
        php_cs_fixer = {
          command = "php-cs-fixer",
          args = {
            "fix",
            "--rules=@PSR12",
            "$FILENAME",
          },
          stdin = false,
        },
        pint = {
          command = "pint",
          args = { "$FILENAME" },
          stdin = false,
        },
      },
    },
  },

  -- Laravel.nvim - Suporte específico para Laravel
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel Routes" },
      { "<leader>lm", ":Laravel related<cr>", desc = "Laravel Related" },
    },
    event = { "VeryLazy" },
    config = true,
  },

  -- Blade.nvim - Syntax para Blade templates
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },

  -- PHP Namespace
  {
    "arnaud-lb/vim-php-namespace",
    ft = "php",
    keys = {
      {
        "<leader>pn",
        ":call PhpInsertUse()<cr>",
        desc = "Insert PHP use statement",
        ft = "php",
      },
      {
        "<leader>pe",
        ":call PhpExpandClass()<cr>",
        desc = "Expand PHP class",
        ft = "php",
      },
    },
  },

  -- DAP (Debug Adapter Protocol)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
      { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue" },
      { "<leader>di", "<cmd>DapStepInto<cr>", desc = "Step Into" },
      { "<leader>do", "<cmd>DapStepOver<cr>", desc = "Step Over" },
      { "<leader>dO", "<cmd>DapStepOut<cr>", desc = "Step Out" },
      { "<leader>dt", "<cmd>DapTerminate<cr>", desc = "Terminate" },
      { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle DAP UI" },
    },
    config = function()
      local dap = require("dap")

      -- Configuração PHP Debug Adapter
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}",
          },
        },
      }

      -- DAP UI
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()

      -- Auto-abrir UI ao debugar
      dap.listeners.after.event_initialized["dapui_config"] = function()
        require("dapui").open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        require("dapui").close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        require("dapui").close()
      end
    end,
  },

  -- nvim-dap-ui
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
  },

  -- Neotest - Testing Framework
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-phpunit", -- Adapter para PHPUnit
    },
    keys = {
      { "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run Nearest Test" },
      { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run File Tests" },
      { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Toggle Test Summary" },
      { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Show Test Output" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-phpunit")({
            phpunit_cmd = function()
              return "vendor/bin/phpunit"
            end,
          }),
        },
      })
    end,
  },

  -- Telescope extensions para Laravel
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    keys = {
      { "<leader>flr", "<cmd>Telescope laravel routes<cr>", desc = "Laravel Routes" },
      { "<leader>flc", "<cmd>Telescope laravel commands<cr>", desc = "Laravel Commands" },
    },
  },
}
