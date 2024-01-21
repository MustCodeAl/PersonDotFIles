local cmp = require "cmp"

local plugins = {
    {
        'mrjones2014/legendary.nvim', -- editor actions window like vs code and intellj
        -- since legendary.nvim handles all your keymaps/commands,
        -- its recommended to load legendary.nvim before other plugins
        priority = 10000,
        lazy = false,
        -- sqlite is only needed if you want to use frecency sorting
        dependencies = { 'kkharji/sqlite.lua' },
        config = function()
            require('legendary').setup({

                autocmds = {

                    -- Create autocmds and augroups
                    { 'BufWritePre', vim.lsp.buf.format, description = 'Format on save' },
                    {
                        name = 'MyAugroup',
                        clear = true,
                        -- autocmds here
                    },
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
        "rcarriga/nvim-dap-ui", -- dap ui interface
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
        "williamboman/mason.nvim", -- plugin installer
        ops = {
            ensure_installed = {
                "black",

                "debugpy",
                "mypy",
                "ruff",

                "prettierd",
                "tailwindcss-language-server",
            }


        },
    },

    { "williamboman/mason-lspconfig.nvim",
      lazy = false,
      config = function()
          require("mason-lspconfig").setup {
              ensure_installed = { "rust_analyzer",

                                   "pyright",
                                   "eslint",

              },
          }
      end,


    },


    {
        'nvim-treesitter/nvim-treesitter-context', -- add context bars at status bar for top
        lazy = false
    },
    {
        "github/copilot.vim", -- github copilot
        lazy = false,
        config = function()
            -- Mapping tab is already used by NvChad
            vim.g.copilot_no_tab_map = true;
            vim.g.copilot_assume_mapped = true;
            vim.g.copilot_tab_fallback = "";-- The mapping is set to other key, see custom/lua/mappings
            -- or run <leader>ch to see copilot mapping section
        end
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,

    },


    {
        "mfussenegger/nvim-dap", -- debugger for every language
        init = function()
            require("core.utils").load_mappings("dap")
            require "custom.configs.dap"

        end
    },
    {
        "mfussenegger/nvim-dap-python", -- debugger for python language
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
        "theHamsta/nvim-dap-virtual-text", -- show debugger errors in line
        lazy = false,
        config = function(_, opts)
            require("nvim-dap-virtual-text").setup()
        end
    },

    {
        "yamatsum/nvim-cursorline", -- add underline to word undernetih curosr
        lazy = false,
    },
    {
        "HiPhish/rainbow-delimiters.nvim", -- add rainbow delimiters like rainbow brackets
        lazy = false,
    },
    {
        'gelguy/wilder.nvim', -- better menu for commands
        dependencies = { 'romgrk/fzy-lua-native', },
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
        'sakhnik/nvim-gdb' -- code lldb and gdb integration
    },

    {
        "utilyre/barbecue.nvim", -- window bars for coding
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
    },
    {
        'mfussenegger/nvim-lint', -- linting plugin
    },
    {
        'mhartington/formatter.nvim', -- formatting for all linters
        config = function()
            require "custom.configs.formatter"
        end,
    },
    {
        'mrcjkb/rustaceanvim', -- rust plugin
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
                tools = {
                    hover_actions = {
                        auto_focus = true,
                    },

                },
                inlay_hints = {
                    highlight = "NonText",
                },
                server = {
                    on_attach = function(client, bufnr)
                        require("lsp-inlayhints").on_attach(client, bufnr)

                        -- you can also put keymaps in here
                    end,
                },
            }
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim", -- refacotring plugin
        
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
    },
    { "pmizio/typescript-tools.nvim", -- typescript tools
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {},

    },
    {
        "ray-x/web-tools.nvim", -- web tools
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
        "hinell/lsp-timeout.nvim", -- idle loading for lsp
        dependencies = "neovim/nvim-lspconfig",
        lazy = false,
    },
    {
        'VidocqH/lsp-lens.nvim', -- intellj like code usage lens
        config = function()
            require('lsp-lens').setup()
        end,

    },
    {
        "kylechui/nvim-surround", -- surround vim brackets
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'christoomey/vim-tmux-navigator', -- tmux integration
    },
    {
        'onsails/lspkind.nvim', -- pictograms for code completion menu
        lazy = false,
        config = function()
            require('lspkind').init({
            })
        end,
    },
    --    {
    --        "cpea2506/relative-toggle.nvim",
    --        lazy = false,
    --    },
    {
        "ThePrimeagen/harpoon", -- bookmarks for code
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'duane9/nvim-rg', --rip grep intergration
    },
    {
        "0oAstro/dim.lua", -- code focusing feature to turn  code grey when not used
        dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
    },
    {
        'stevearc/dressing.nvim', -- better ui for neovim menus
        opts = {},
        lazy = false,
    },


    {
        'nvim-treesitter/nvim-treesitter-textobjects', -- text swapping features
    },
    {
        'Wansmer/treesj', -- code spllitting and joining blocks of code
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({--[[ your config ]]})
        end,
    },

    {
        "cshuaimin/ssr.nvim", -- strucutred search and replace

    },

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build', lazy = false }, -- use fzf for telescope

    {
        "nvim-telescope/telescope.nvim", -- override default telescope to aadd fzf
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

    { 'kosayoda/nvim-lightbulb', -- lightbux to show somemthing needs to get fixed
      lazy = false,
      config = function()
          require("nvim-lightbulb").setup({
              autocmd = { enabled = true }
          })
      end,
    },
    {
        'nvim-lua/lsp-status.nvim', -- lsp information on jobs
        lazy = false,
        config = function()
            require('lsp-status').register_progress()
        end
    },

    {
        "folke/trouble.nvim", -- pretty list for showing errors
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        config = function()
            dofile(vim.g.base46_cache .. "trouble")
            require("trouble").setup()
        end
    },


    {
        'wfxr/minimap.vim', -- code glance lens
        lazy = false,
        build = "cargo install --locked code-minimap",
        cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
        init = function()
            vim.cmd("let g:minimap_width = 10")
            vim.cmd("let g:minimap_auto_start = 1")
        end,
    },

}

return plugins
