local cmp = require "cmp"

local plugins = {
    {
        'mrjones2014/legendary.nvim',
        -- since legendary.nvim handles all your keymaps/commands,
        -- its recommended to load legendary.nvim before other plugins
        priority = 10000,
        lazy = false,
        -- sqlite is only needed if you want to use frecency sorting
        dependencies = { 'kkharji/sqlite.lua' },
        config = function()
            require('legendary').setup({

                autocmds = {

                },

                -- load extesnions
                extensions = {
                    nvim_tree = true,
                    lazy_nvim = true,
                    lazy_nvim = {
                        auto_register = true,
                    },
                    which_key = {
                        -- Automatically add which-key tables to legendary
                        -- see WHICH_KEY.md for more details
                        auto_register = true,

                        -- controls whether legendary.nvim actually binds they keymaps,
                        -- or if you want to let which-key.nvim handle the bindings.
                        -- if not passed, true by default
                        do_binding = true,
                        -- controls whether to use legendary.nvim item groups
                        -- matching your which-key.nvim groups; if false, all keymaps
                        -- are added at toplevel instead of in a group.
                        use_groups = true,
                    },
                },

            })
            require('which-key').register()


        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },

    {
        "williamboman/mason.nvim",
        ops = {
            ensure_installed = {
                "rust-analyzer",
                "black",
                "debugpy",
                "mypy",
                "ruff",
                "pyright",
                "eslint-lsp",
                "prettierd",
                "tailwindcss-language-server",
                "typescript-language-server",
            },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        lazy = false
    },
    {
        "github/copilot.vim",
        lazy = false,
        config = function()
            -- Mapping tab is already used by NvChad
            vim.g.copilot_no_tab_map = true;
            vim.g.copilot_assume_mapped = true;
            vim.g.copilot_tab_fallback = "";-- The mapping is set to other key, see custom/lua/mappings
            -- or run <leader>ch to see copilot mapping section
        end
    },
    --    {
    --        "zbirenbaum/copilot.lua",
    --        cmd = "Copilot",
    --        event = "InsertEnter",
    --        config = function()
    --            require("copilot").setup({})
    --        end,
    --    },
    --    {
    --        "zbirenbaum/copilot-cmp",
    --        config = function()
    --            require("copilot_cmp").setup()
    --        end
    --    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,

    },
    {
        "lvimuser/lsp-inlayhints.nvim",
        lazy = false,
        config = function()
            require("lsp-inlayhints").setup()
            require("lsp-inlayhints").toggle()
            require('lsp-inlayhints').show()
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,

    },
    --		disabling rust-tools
    --	{
    --		"simrat39/rust-tools.nvim",
    --		ft = "rust",
    --		dependencies = "neovim/nvim-lspconfig",
    --
    --		opts = function ()
    --			return require "custom.configs.rust-tools"
    --		end,
    --		config = function(_, opts)
    --			require('rust-tools').setup(opts)
    --		end
    --
    --	},



    {
        "mfussenegger/nvim-dap",
        init = function()
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("core.utils").load_mappings("dap_python")
        end,
    },

    {
        'saecki/crates.nvim',
        dependencies = "hrsh7th/nvim-cmp",
        ft = { "toml" },
        config = function(_, opts)
            local crates = require('crates')
            crates.setup(opts)
            require('cmp').setup.buffer({
                sources = { { name = "crates" } }
            })

            crates.show()
            require("core.utils").load_mappings("crates")

        end,
    },
    {
    "windwp/nvim-ts-autotag",
    ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
    {
        "theHamsta/nvim-dap-virtual-text",
        lazy = false,
        config = function(_, opts)
            require("nvim-dap-virtual-text").setup()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local M = require "plugins.configs.cmp"
            M.completion.completeopt = "menu,menuone,noselect"
            M.mapping["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = false,
            }
            table.insert(M.sources, { name = "crates" })
            return M
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = { "python" },
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },
    { "folke/neodev.nvim", opts = {}, lazy = false },
    {
        "yamatsum/nvim-cursorline",
        lazy = false,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        lazy = false,
    },
    {
        'gelguy/wilder.nvim',
        dependencies = { 'roxma/nvim-yarp',
                         'roxma/vim-hug-neovim-rpc',
                         'romgrk/fzy-lua-native', },
        lazy = false,
        config = function()
            local wilder = require("wilder")
            wilder.setup({ modes = { ':', '/', '?' } })
            wilder.set_option('renderer', wilder.renderer_mux({
                [':'] = wilder.popupmenu_renderer({
                    highlighter = wilder.lua_fzy_highlighter(),
                    left = {
                        ' ',
                        wilder.popupmenu_devicons()
                    },
                    right = {
                        ' ',
                        wilder.popupmenu_scrollbar()
                    },
                }),
                ['/'] = wilder.wildmenu_renderer({
                    highlighter = wilder.lua_fzy_highlighter(),
                }),
            }))

        end,
    },
    {
        'sakhnik/nvim-gdb'
    },
    {
        "luukvbaal/statuscol.nvim",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            -- local builtin = require("statuscol.builtin")
            require("statuscol").setup({
            })
        end,
        lazy = false,
    },

    {
        "SmiteshP/nvim-navic",
        lazy = false,
    },
    {
        'gorbit99/codewindow.nvim',
        lazy = false,
        config = function()
            local codewindow = require('codewindow')
            codewindow.setup()
            codewindow.apply_default_keybinds()
        end,
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        lazy = false,
        opts = {
            -- configurations go here
        },
    },
    {
        'mfussenegger/nvim-lint',
        lazy = false,
    },
    {
        'mhartington/formatter.nvim',
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^3', -- Recommended
        ft = { 'rust' },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
            {
                "lvimuser/lsp-inlayhints.nvim",
                opts = {}
            },
        },
        config = function()
            vim.g.rustaceanvim = {
                -- Update this path
                dap = {
                    adapter = require('rustaceanvim.dap').get_codelldb_adapter('~/.vscode-insiders/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb', '~/.vscode-insiders/extensions/vadimcn.vscode-lldb-1.10.0/lldb/lib/liblldb.dylib'),
                },
                --                inlay_hints = {
                --                    highlight = "NonText",
                --                },
                tools = {
                    hover_actions = {
                        auto_focus = true,
                    },

                },
                --server = {
                --on_attach = function(client, bufnr)
                --require("lsp-inlayhints").on_attach(client, bufnr)

                --end
                --}

            }
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
    },
    { "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {},

    },
    {
        "ray-x/web-tools.nvim",
        config = function()
            require 'web-tools'.setup({
                keymaps = {
                    rename = nil, -- by default use same setup of lspconfig
                    repeat_rename = '.', -- . to repeat
                },
                hurl = {  -- hurl default
                    show_headers = false, -- do not show http headers
                    floating = false, -- use floating windows (need guihua.lua)
                    json5 = false, -- use json5 parser require json5 treesitter
                    formatters = {  -- format the result by filetype
                        json = { 'jq' },
                        html = { 'prettier', '--parser', 'html' },
                    },
                },
            })
        end,


    },
    {
        "hinell/lsp-timeout.nvim",
        dependencies = "neovim/nvim-lspconfig",
        lazy = false,
    },
    {
        'VidocqH/lsp-lens.nvim',
        lazy = false,
        config = function()
            require('lsp-lens').setup()
        end,

    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'christoomey/vim-tmux-navigator',
    },
    {
        'onsails/lspkind.nvim',
        lazy = false,
        config = function()
            require('lspkind').init({
                -- DEPRECATED (use mode instead): enables text annotations
                --
                -- default: true
                -- with_text = true,

                -- defines how annotations are shown
                -- default: symbol
                -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                mode = 'symbol_text',

                -- default symbol map
                -- can be either 'default' (requires nerd-fonts font) or
                -- 'codicons' for codicon preset (requires vscode-codicons font)
                --
                -- default: 'default'
                preset = 'codicons',

                -- override preset symbols
                --
                -- default: {}
                symbol_map = {
                    Text = "󰉿",
                    Method = "󰆧",
                    Function = "󰊕",
                    Constructor = "",
                    Field = "󰜢",
                    Variable = "󰀫",
                    Class = "󰠱",
                    Interface = "",
                    Module = "",
                    Property = "󰜢",
                    Unit = "󰑭",
                    Value = "󰎠",
                    Enum = "",
                    Keyword = "󰌋",
                    Snippet = "",
                    Color = "󰏘",
                    File = "󰈙",
                    Reference = "󰈇",
                    Folder = "󰉋",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "󰙅",
                    Event = "",
                    Operator = "󰆕",
                    TypeParameter = "",
                },
            })
        end,
    },
    {
        "cpea2506/relative-toggle.nvim",
        lazy = false,
    },
    {
        'ThePrimeagen/harpoon',
    },
    {
        'duane9/nvim-rg',
    },
    {
        "0oAstro/dim.lua",
        dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
        lazy = false,
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
        lazy = false,
    },
    { "andrewferrier/debugprint.nvim",
      lazy = false,

        -- Dependency only needed for NeoVim 0.8
      dependencies = {
          "nvim-treesitter/nvim-treesitter"
      },
    },

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        lazy = false,
    },
    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({--[[ your config ]]})
        end,
    },
    {
        'ThePrimeagen/vim-be-good',
    },

    --    {
    --        "m4xshen/hardtime.nvim",
    --        lazy = false,
    --        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    --        opts = {disable_mouse = false, restriction_mode = "hint" }
    --    },
    { 'rcarriga/nvim-notify' },
    {
        'mizlan/iswap.nvim',
    },
    {
        "cshuaimin/ssr.nvim",

    },

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build', lazy = false },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
        },
        config = function()
            require("telescope").setup({
                -- the rest of your telescope config goes here
                extensions = {
                    undo = {
                        -- telescope-undo.nvim config, see below
                    },
                    -- other extensions:
                    -- file_browser = { ... }
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }

                },
            })
            require("telescope").load_extension("undo")
            require("telescope").load_extension("fzf")

            -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        end,
    },
    {
        "smjonas/live-command.nvim",
        lazy = false,
        -- live-command supports semantic versioning via tags
        -- tag = "1.*",
        config = function()
            require("live-command").setup {
                commands = {
                    Norm = { cmd = "norm" },
                },
            }
        end,
    },
    { 'kosayoda/nvim-lightbulb',
      lazy = false,
      config = function()
          require("nvim-lightbulb").setup({
              autocmd = { enabled = true }
          })
      end,
    },
    {
        'nvim-lua/lsp-status.nvim',
        lazy = false,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    {
  "folke/trouble.nvim",
  cmd = "Trouble",
  config = function()
     dofile(vim.g.base46_cache .. "trouble")
     require("trouble").setup()
  end
}, {
    'wfxr/minimap.vim',
  },
  {
    'neoclide/coc.nvim',
  }

}

return plugins
