-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " " -- Same for `maplocalleader`

-- vim:foldmethod=marker
---@diagnostic disable: different-requires
-- Automatically download lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  {  
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
  },
  -- Core {{{
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "core.lspconfig"
    end,
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    after = "mason.nvim",
    event = "VeryLazy",
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require "core.mason"
    end,
    event = "VeryLazy",
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "core.null-ls"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
    },
    event = "VeryLazy",
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require "core.project"
    end,
    event = "VeryLazy",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "core.treesitter"
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "windwp/nvim-ts-autotag" },
      { "mrjones2014/nvim-ts-rainbow", enabled = false },
      { "RRethy/nvim-treesitter-endwise" },
      { "RRethy/nvim-treesitter-textsubjects", enabled = false },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
    event = "VeryLazy",
  },

  {
    "stevearc/overseer.nvim",
    config = function()
      require "core.overseer"
    end,
    event = "VeryLazy",
  },

  {
    "tpope/vim-sleuth",
    event = "VeryLazy",
  },

  {
    "folke/which-key.nvim",
    config = function()
      require "core.which-key"
    end,
    event = "VeryLazy",
  },

  {
    "ii14/emmylua-nvim",
    lazy = true,
  },
  -- }}}

  -- Text Editing {{{
  {
    "github/copilot.vim",
    config = function()
      require "edit.copilot"
    end,
    event = "VeryLazy",
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "edit.cmp"
    end,
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-calc" },
      { "saadparwaiz1/cmp_luasnip" },
      { "kristijanhusak/vim-dadbod-completion" },
      { "lukas-reineke/cmp-under-comparator" },
    },
    event = "VeryLazy",
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require "edit.snip"
    end,
    event = "VeryLazy",
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require "edit.comment"
    end,
    event = "VeryLazy",
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require "edit.surround"
    end,
    event = "VeryLazy",
  },

  {
    "RaafatTurki/hex.nvim",
    config = function()
      require "edit.hex"
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require "edit.autopairs"
    end,
    event = "VeryLazy",
  },
    
  {
    "ThePrimeagen/refactoring.nvim",
    config = function()
      require "edit.refactoring"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  -- Interface Extension {{{
  {
    "folke/noice.nvim",
    config = function()
      require "interface.noice"
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "akinsho/nvim-bufferline.lua",
    config = function()
      require "interface.bufferline"
    end,
    dependencies = { 
     { "kyazdani42/nvim-web-devicons" },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "interface.lualine"
    end,
    dependencies = {
      { "kyazdani42/nvim-web-devicons" },
      { "ofseed/lualine-copilot" },
    },
  },

  {
    "utilyre/barbecue.nvim",
    config = function()
      require "interface.barbecue"
    end,
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "SmiteshP/nvim-navic" },
      { "kyazdani42/nvim-web-devicons" },
    },
  },

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require "interface.statuscol"
    end,
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require "interface.illuminate"
    end,
    event = "VeryLazy",
  },

  {
    "kevinhwang91/nvim-ufo",
    config = function()
      require "interface.ufo"
    end,
    dependencies = {
      { "kevinhwang91/promise-async" },
    },
    event = "VeryLazy",
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require "interface.lsp-inlayhints"
    end,
    event = "VeryLazy",
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "interface.indent-blankline"
    end,
    event = "VeryLazy",
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require "interface.dressing"
    end,
    event = "VeryLazy",
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require "interface.lsp_signature"
    end,
    event = "VeryLazy",
  },

  {
    "onsails/lspkind-nvim",
    config = function()
      require "interface.lspkind"
    end,
    event = "VeryLazy",
  },

  {
    "goolord/alpha-nvim",
    config = function()
      require "interface.alpha"
    end,
  },

  {
    "j-hui/fidget.nvim",
    config = function()
      require "interface.fidget"
    end,
    event = "VeryLazy",
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require "interface.notify"
    end,
  },

  {
    "uga-rosa/ccc.nvim",
    config = function()
      require "interface.ccc"
    end,
    enabled = false,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "interface.colorizer"
    end,
    event = "VeryLazy",
  },


  {
    "lewis6991/satellite.nvim",
    config = function()
      require "interface.satellite"
    end,
    -- A substitue for nvim-scrollview
    -- which support search resultsuse lsp diagnostics and git hunks
    -- Disable because it's work in progress
  },

  {
    "utilyre/sentiment.nvim",
    config = function()
      require "interface.sentiment"
    end,
    event = "VeryLazy",
  },

  {
    "kevinhwang91/nvim-bqf",
    config = function()
      require "interface.bqf"
    end,
    event = "VeryLazy",
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require "interface.todo-comments"
    end,
    event = "VeryLazy",
  },

  {
    "chentoast/marks.nvim",
    config = function()
      require "interface.marks"
    end,
    event = "VeryLazy",
  },

  {
    "jbyuki/nabla.nvim",
    config = function()
      require "interface.nabla"
    end,
    ft = { "tex", "markdown" },
  },

  -- }}}

  -- Colorscheme {{{
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require "colorscheme.catppuccin"
    end,
    build = ":CatppuccinCompile",
  },

  {
    "folke/tokyonight.nvim",
    config = function()
      require "colorscheme.tokyonight"
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require "colorscheme.rose-pine"
    end,
  },

  {
    "EdenEast/nightfox.nvim",
    config = function()
      require "colorscheme.nightfox"
    end,
  },

  {
    "navarasu/onedark.nvim",
    config = function()
      require "colorscheme.onedark"
    end,
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
  },

  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require "colorscheme.gruvbox"
    end,
  },

  {
    "LunarVim/horizon.nvim",
  },
  -- }}}

  -- Tool Integration {{{
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "tool.tree"
    end,
    dependencies = { "kyazdani42/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" },
    },
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require "tool.symbols-outline"
    end,
    dependencies = { "kyazdani42/nvim-web-devicons" },
    cmd = { "SymbolsOutline" },
    enabled = false,
    -- Subtitute for aerial.nvim
    -- Disable because better to , aerial.nvim
  },

  {
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require "tool.toggleterm"
    end,
    version = "v2.*",
    event = "VeryLazy",
  },

  {
    "stevearc/aerial.nvim",
    config = function()
      require "tool.aerial"
    end,
    keys = {
      { "<leader>a", "<Cmd>AerialToggle<CR>", desc = "Outline" },
    },
  },

  {
    "SmiteshP/nvim-navbuddy",
    config = function()
      require "tool.navbuddy"
    end,
    event = "VeryLazy",
  },

  {
    "s1n7ax/nvim-window-picker",
    version = "v1.*",
    config = function()
      require "tool.window-picker"
    end,
    event = "VeryLazy",
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "tool.gitsigns"
    end,
    dependencies = "nvim-lua/plenary.nvim",
    -- Lasy load cause error
  },

  {
    "TimUntersberger/neogit",
    config = function()
      require "tool.neogit"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    keys = {
      { "<leader>gg", "<Cmd>Neogit<CR>", desc = "Open Neogit" },
    },
  },

  {
    "sindrets/diffview.nvim",
    config = function()
      require "tool.diffview"
    end,
    event = "VeryLazy",
  },

  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },

  {
    "aserowy/tmux.nvim",
    config = function()
      require "tool.tmux"
    end,
    event = "VeryLazy",
  },

  {
    "iamcco/markdown-preview.nvim",
    config = function()
      require "tool.markdown-preview"
    end,
    build = "cd app && yarn install",
    ft = { "markdown" },
  },

  {
    "Saecki/crates.nvim",
    config = function()
      require "tool.crates"
    end,
    dependencies = { 
      { "nvim-lua/plenary.nvim" }
    },
    event = { "BufRead Cargo.toml" },
  },

  {
    "vuki656/package-info.nvim",
    config = function()
      require "tool.package-info"
    end,
    dependencies = { 
      { "MunifTanjim/nui.nvim" }
    },
    event = {
      "BufRead package.json",
      "BufRead package-lock.json",
    },
  },

  -- Efficiency Improvement {{{
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "efficiency.telescope"
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-hop.nvim" },
      { "nvim-telescope/telescope-project.nvim" },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "nvim-telescope/telescope-dap.nvim" },
      { "benfowler/telescope-luasnip.nvim" },
    },
    branch = "0.1.x",
    event = "VeryLazy",
  },

  {
    "phaazon/hop.nvim",
    config = function()
      require "efficiency.hop"
    end,
    branch = "v2",
    event = "VeryLazy",
  },

  {
    "mfussenegger/nvim-treehopper",
    config = function()
      require "efficiency.treehopper"
    end,
    event = "VeryLazy",
  },

  {
    "kevinhwang91/vim-ibus-sw",
    event = "VeryLazy",
  },

  {
    "Pocco81/auto-save.nvim",
    config = function()
      require "efficiency.auto-save"
    end,
  },

  {
    "Shatur/neovim-session-manager",
    config = function()
      require "efficiency.session-manager"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    event = "VeryLazy",
  },

  {
    "chrisgrieser/nvim-spider",
    config = function()
      require "efficiency.spider"
    end,
    event = "VeryLazy",
  },

  {
    "monaqa/dial.nvim",
    config = function()
      require "efficiency.dial"
    end,
    event = "VeryLazy",
  },

  {
    "willothy/flatten.nvim",
    config = function()
      require "efficiency.flatten"
    end,
  },
  -- }}}

  -- Debug And Run {{{
  {
    "michaelb/sniprun",
    config = function()
      require "debug.sniprun"
    end,
    build = "bash install.sh",
    event = "VeryLazy",
  },

  {
 ~
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "debug.dap"
    end,
    event = "VeryLazy",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
    },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require "debug.dap-virtual-text"
    end,
    event = "VeryLazy",
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require "debug.dap-ui"
    end,
    requires = {
      { "mfussenegger/nvim-dap" },
    },
    event = "VeryLazy",
  },

  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require "debug.dap-python"
    end,
    ft = { "python" },
  },
  -- }}}

  -- Lang
  {
    "p00f/clangd_extensions.nvim",
    config = function()
      require "language.clangd_extensions"
    end,
    ft = {
      "c",
      "cpp",
      "objc",
      "objcpp",
      "cuda",
      "proto",
    },
  },

  {
    "simrat39/rust-tools.nvim",
    config = function()
      require "language.rust-tools"
    end,
    ft = {
      "rust",
    },
  },

  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require "language.typescript"
    end,
    ft = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  },

  {
    "b0o/SchemaStore.nvim",
    config = function()
      require "language.schema-store"
    end,
    ft = {
      "json",
      "jsonc",
    },
  },

  {
    "nanotee/sqls.nvim",
    enabled = false,
  },

  {
    "fladson/vim-kitty",
    event = { "BufRead kitty.conf" },
  },
  -- }}}
}, {
  root = vim.fn.stdpath "data" .. "/lazy", -- directory where plugins will be installed
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
    version = nil,
    -- version = "*", -- enable this to try installing the latest stable versions of plugins
  },
  -- leave nil when passing the spec as the first argument to setup()
  spec = nil,
  lockfile = vim.fn.stdpath "config" .. "/lazy-lock.json", -- lockfile generated after running update.
  concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "--since=3 days ago" }, -- show commits from the last 3 days
    timeout = 120, -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
    -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
    -- then set the below to false. This is should work, but is NOT supported and will
    -- increase downloads a lot.
    filter = true,
  },
  dev = {
    -- directory where you store your local plugin projects
    path = "~/Documents/code/nvim",
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {
      "ofseed",
    }, -- For example {"folke"}
    fallback = true, -- Fallback to git when local plugin doesn't exist
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "habamax" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    wrap = true, -- wrap the lines in the ui
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "鈴 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
    -- leave nil, to automatically select a browser depending on your OS.
    -- If you want to use a specific browser, you can define it here
    browser = nil, ---@type string?
    throttle = 20, -- how frequently should the ui process render events
    custom_keys = {
      -- you can define custom key maps here.
      -- To disable one of the defaults, set it to false

      -- open lazygit log
      ["<localleader>l"] = function(plugin)
        require("lazy.util").float_term({ "lazygit", "log" }, {
          cwd = plugin.dir,
        })
      end,

      -- open a terminal for the plugin dir
      ["<localleader>t"] = function(plugin)
        require("lazy.util").float_term(nil, {
          cwd = plugin.dir,
        })
      end,
    },
  },
  diff = {
    -- diff command <d> can be one of:
    -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
    --   so you can have a different command for diff <d>
    -- * git: will run git diff and open a buffer with filetype git
    -- * terminal_git: will open a pseudo terminal with git diff
    -- * diffview.nvim: will open Diffview to show the diff
    cmd = "diffview.nvim",
  },
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = false, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath "cache" .. "/lazy/cache",
      -- Once one of the following events triggers, caching will be disabled.
      -- To cache all modules, set this to `{}`, but that is not recommended.
      -- The default is to disable on:
      --  * VimEnter: not useful to cache anything else beyond startup
      --  * BufReadPre: this will be triggered early when opening a file from the command line directly
      disable_events = { "UIEnter", "BufReadPre" },
      ttl = 3600 * 24 * 5, -- keep unused modules for up to 5 days
    },
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
a        -- "zipPlugin",
      },
    },
  },
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  readme = {
    root = vim.fn.stdpath "state" .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md" },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
  state = vim.fn.stdpath "state" .. "/lazy/state.json", -- state info for checker and other things
})
