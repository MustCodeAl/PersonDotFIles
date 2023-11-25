local cmp = require "cmp"

local plugins = {
	  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
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
			  },
			 },
	  },
	  {
  "github/copilot.vim",
  lazy = false,
  config = function()  -- Mapping tab is already used by NvChad
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
		"lvimuser/lsp-inlayhints.nvim",
		lazy = false,
		config = function() 
			require("lsp-inlayhints").setup()
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function ()
			vim.g.rustfmt_autosave = 1
		end
		
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
    ft = {"toml"},
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
	      sources = { { name = "crates" }}
      })
      
      crates.show()
      require("core.utils").load_mappings("crates")
      
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
    opts = function ()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
    {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
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
  		'roxma/vim-hug-neovim-rpc', 'romgrk/fzy-lua-native',},
  		lazy = false,
  		config = function()
      		local wilder = require("wilder")
      		wilder.setup({modes = {':', '/', '?'}})
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
	config = function () 
		vim.g.rustaceanvim = {
  -- Update this path
  			dap = {
      			adapter = require('rustaceanvim.dap').get_codelldb_adapter('/Users/albertdoh/.vscode-insiders/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb', '/Users/albertdoh/.vscode-insiders/extensions/vadimcn.vscode-lldb-1.10.0/lldb/lib/liblldb.dylib'),
    		},
    		     inlay_hints = {
        highlight = "NonText",
      },
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
      server = {
        on_attach = function(client, bufnr)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end
      }

 	}
 	end,
}	

	
}

return plugins
