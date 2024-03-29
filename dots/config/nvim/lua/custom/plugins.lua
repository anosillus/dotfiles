local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- Default plugin{{{
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("custom.configs.null-ls")
        end,
      },
      {
        "ErichDonGubler/lsp_lines.nvim",
        config = function()
          -- require("lsp_lines").setup()
          vim.diagnostic.config({ virtual_lines = false })
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end, -- Override to setup mason-lspconfig
  },
  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "Pocco81/auto-save.nvim",
    disable=true
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  -- {
  -- "luk400/vim-jukit",
  -- keys = {
  -- { "<C-b>", "<CMD>call jukit#splits#output()<cr>", desc = "sniprun", mode = { "n" } },
  -- },
  -- },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "python", "delve" },
      automatic_installation = true,
      automatic_setup = true,
    },
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    opts = {
      ensure_installed = nil,
      automatic_installation = true,
      automatic_setup = true,
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    init = function()
    end,
    cmd = "Telescope",
    config = function()
      require("custom.configs.telescope")
    end,
    dependencies = {
      {
        "nvim-telescope/telescope-github.nvim",
        config = function()
          require("telescope").load_extension("gh")
        end,
      },
      {
        "IMOKURI/apyrori.nvim",
        config = function()
          require("apyrori").setup({
            choose_most_likely = true,
            default_imports = {
              "import numpy as np",
              "import pandas as pd",
              "import seaborn as sns",
            },
          })
        end,
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
          require("telescope").load_extension("ui-select")
        end,
      },
      {
        "LinArcX/telescope-changes.nvim",
        config = function()
          require("telescope").load_extension("changes")
        end,
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
      },
      {
        "nvim-telescope/telescope-smart-history.nvim",
        config = function()
          require("telescope").load_extension("smart_history")
        end,
        build = function()
          os.execute("mkdir -p " .. vim.fn.stdpath("state") .. "databases/")
        end,
      },
      { "nvim-telescope/telescope-symbols.nvim" },
      {
        "debugloop/telescope-undo.nvim",
        config = function()
          require("telescope").load_extension("undo")
        end,
      },
    },
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    -- event = "VeryLazy",
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    -- event = "VeryLazy",
    enabled = function()
      return vim.fn.executable("ueberzug")
    end,
    config = function()
      require("telescope").load_extension("media_files")
    end,
  },
  {
    "crispgm/telescope-heading.nvim",
    -- event = "VeryLazy",
    config = function()
      require("telescope").load_extension("heading")
    end,
  },
  -- }}}
  -- QuickRun {{{
  {
    "michaelb/sniprun",
    build = "bash install.sh",
    cmd = { "SnipRun" },
    keys = {
      { "<C-b>", "<CMD>SnipRun<cr>",      desc = "sniprun", mode = { "n" } },
      { "<C-b>", "<CMD>'<,'>SnipRun<cr>", desc = "sniprun", mode = { "v" } },
    },
  },
  {
    "sansyrox/vim-python-virtualenv",
    ft = "python",
  },
    -- {
  -- 	"smzm/hydrovim",
  -- 	dependencies = "MunifTanjim/nui.nvim",
  -- 	ft = "python",
  -- 	keys = {
  -- 		{ "bb", "<CMD> call HydrovimRun('normal')<cr>", desc = "sniprun", mode = { "n" } },
  -- 		{ "bb", "<CMD> call HydrovimRun('visual')<cr>", desc = "sniprun", mode = { "v" } },
  -- 	},
  -- },
  {
    "folke/neodev.nvim",
    opts = {
      library = { plugins = { "neotest" }, types = true },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "rouge8/neotest-rust",
    },
    keys = {
      -- TODO  'b' would be prefix of dap and tests, sniprun.
      -- https://github.com/nvim-neotest/neotest/blob/master/doc/neotest.txt
      { "lb", '<CMD>lua require("neotest").run.run()<CR>', desc = "test run", mode = { "n" } },
      {
        "lB",
        'lua require("neotest").run.run(vim.fn.expand("%"))',
        desc = "test run",
        mode = { "n" },
      },
      {
        "lK",
        '<CMD>lua require("neotest").run.run_last({ strategy = "dap" })<CR>',
        desc = "test open",
        mode = { "n" },
      },
      {
        "lk",
        '<CMD>lua require("neotest").output.open({ enter = true })<CR>',
        desc = "test open",
        mode = { "n" },
      },
      {
        "lm",
        '<CMD>lua require("neotest").output_panel.toggle()<CR>',
        desc = "test toggle",
        mode = { "n" },
      },
    },
    --   vim.keymap.set('n', '<leader>ns', function() require('neotest').summary.toggle() end, opts)
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings("dap")
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("dapui").setup()
        end,
      },
      { "jbyuki/one-small-step-for-vimkind" },
      {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        config = function()
          local venv = os.getenv("VIRTUAL_ENV")
          local command = string.format("%s/bin/python", venv)
          require("dap-python").setup(command)
        end,
      },
    },
  },
  -- }}}
  -- direcoty {{{
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({})
    end,
  },
  -- }}}
  -- View {{{
  {
    "tmhedberg/SimpylFold",
    ft = "python",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-tresitter",
    config = function()
      require("nvim-treesitter-context").setup()
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
          width = 120,   -- width of the Zen window
          height = 1,    -- height of the Zen window
          options = {
            signcolumn = "no", -- disable signcolumn
            number = false, -- disable number column
            -- relativenumber = false, -- disable relative numbers
            -- cursorline = false, -- disable cursorline
            cursorcolumn = false, -- disable cursor column
            foldcolumn = "0", -- disable fold column
            list = false,   -- disable whitespace characters
          },
        },
        plugins = {
          -- disable some global vim options (vim.o...)
          -- comment the lines to not apply the options
          options = {
            enabled = true,
            ruler = false,           -- disables the ruler text in the cmd line area
            showcmd = false,         -- disables the command in the last line of the screen
          },
          twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
          gitsigns = { enabled = false }, -- disables git signs
          tmux = { enabled = false }, -- disables the tmux statusline
          -- this will change the font size on kitty when in zen mode
          -- to make this work, you need to set the following kitty options:
          -- - allow_remote_control socket-only
          -- - listen_on unix:/tmp/kitty
          kitty = {
            enabled = false,
            font = "+4", -- font size increment
          },
          -- this will change the font size on alacritty when in zen mode
          -- requires  Alacritty Version 0.10.0 or higher
          -- uses `alacritty msg` subcommand to change font size
          alacritty = {
            enabled = false,
            font = "14", -- font size
          },
          -- this will change the font size on wezterm when in zen mode
          -- See alse also the Plugins/Wezterm section in this projects README
          wezterm = {
            enabled = false,
            -- can be either an absolute font size or the number of incremental steps
            font = "+4", -- (10% increase per step)
          },
        },
        on_open = function()
          vim.g.null_ls_disable = false
          vim.g.diagnostics_visible = false
          vim.diagnostic.disable()
        end,
        on_close = function()
          vim.g.null_ls_disable = true
          vim.g.diagnostics_visible = true
          vim.diagnostic.enable()
        end,
      })
    end,
  },
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup({})
    end,
    keys = {
      { "<C-s>", "<CMD>Twilight<CR>", desc = "zen", mode = { "n" } },
    },
  },
  -- {
  --   'mvllow/modes.nvim',
  --   config = function()
  --     require('modes').setup({
  --       colors = {
  --         copy   = "#f5c359",
  --         delete = "#c75c6a",
  --         visual = "#9745be",
  --       },
  --       line_opacity = 0.15,
  --       set_cursor = true,
  --       set_cursorline = true,
  --       set_number = false,
  --       ignore_filetypes = { 'NvimTree', 'TelescopePrompt' }
  --     })
  --   end
  -- },
  -- }}}
  -- utility {{{
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- }}}
  -- CMP {{{
  {
    "hrsh7th/cmp-path",
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    dependencies = "nvim-lspconfig",
    config = function()
      require("copilot").setup({
        ft_disable = { "go", "dap-repl" },
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup({
        keymap = {
          jump_prev = "<C-e>",
          jump_next = "<C-n>",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        suggestion = {
          enabled = true,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = "<C-o>",
            accept_word = false,
            accept_line = false,
            next = "<C-u>",
            prev = "<C-y>",
            dismiss = "<C-]>",
          },
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    override_options = function() --{{{
      local cmp = require("cmp")
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end
      return {
        mapping = {
          ["<C-y>"] = cmp.mapping.scroll_docs(-4),
          ["<C-u>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-o>"] = cmp.mapping.close(),
          ["<C-s>"] = cmp.mapping.complete({
            config = {
              sources = {
                { name = "copilot" },
              },
            },
          }),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          ["<C-i>"] = cmp.mapping(function(fallback)
            if require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(
                vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                ""
              )
            else
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, true, true), "")
            end
          end, {
            "i",
            "s",
          }),
          ["<C-h>"] = cmp.mapping(function(fallback)
            if require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(
                vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
                ""
              )
            else
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Left>", true, true, true), "")
            end
          end, {
            "i",
            "s",
          }),
          ["<C-n>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
          --   cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   else
          --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Down>", true, true, true), "")
          --   end
          -- end, {
          --   "i",
          --   "s",
          -- }),
          ["<C-e>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
        sources = {
          { name = "luasnip" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "skkeleton" },
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "path" },
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            require("copilot_cmp.comparators").prioritize,

            -- Below is the default comparitor list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      }
    end, --}}}
  },
  {
    "folke/lsp-colors.nvim",
    config = function()
      require("lsp-colors").setup()
    end,
  },
  -- }}}
  -- trouble {{{
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<C-o>", "<CMD>TroubleToggle workspace_diagnostics<CR>",  desc = "snipfix", mode = { "n" } },
      { "gt",    "<cmd>TodoTrouble  keywords=TODO,FIX,FIXME<CR>", desc = "todo",    mode = { "n" } },
      -- 	["<C-o>o"] = { "<cmd>TroubleToggle snipfix <CR>", "Show Error by LSPs" },
      -- 	["<C-o>d"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "diagnostics" },
      -- 	["<C-o>r"] = { "<cmd>TroubleToggle loclist<CR>", "diagnostics" },
      -- 	["<C-o>a"] = { "<cmd>TroubleToggle snipfix<CR>", "diagnostics" },
      -- 	["<C-o>o"] = { "<cmd>TroubleToggle lsp_references<CR>", "diagnostics" },
    },
    config = function()            -- {{{
      require("trouble").setup({
        action_keys = {
                                   -- key mappings for actions in the trouble list
          close = "<C-o>",         -- close the list
          cancel = "<esc>",        -- cancel the preview and get back to your last window / buffer / cursor
          refresh = "r",           -- manually refresh
          jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
          open_split = { "u" },    -- open buffer in new split
          open_vsplit = { "y" },   -- open buffer in new vsplit
          --open_tab = { "<C-o>" }, -- open buffer in new tab
          jump_close = { "o" },    -- jump to the diagnostic and close the list
          toggle_mode = ",",       -- toggle between "workspace" and "document" diagnostics mode
          toggle_preview = ".",    -- toggle auto_preview
          hover = "B",             -- opens a small popup with the full multiline message
          preview = "b",           -- preview the diagnostic location
          close_folds = { "mM" },  -- close all folds
          open_folds = { "mm" },   -- open all folds
          toggle_fold = { "mi", "mh" }, -- toggle fold of current file
          previous = "e",          -- previous item
          next = "n",              -- next item
        },
        auto_open = false,
        auto_close = false,
        use_diagnostic_signs = true,
      })
    end, -- }}}
  },
  -- }}}
  -- Mapping {{{
  {
    "anuvyklack/hydra.nvim",
    init = function()
      local Hydra = require("hydra")
      local cmd = require("hydra.keymap-util").cmd
      Hydra({
           -- {{{
        name = "window",
        mode = "n",
        body = "<C-g>",
        heads = {
          { "h", "<C-w>>", { desc = "windows width ←/→" } },
          { "i", "<C-w><", { desc = "windows width ←/→" } },
          { "n", "<C-w>+", { desc = "window height ↑/↓" } },
          { "e", "<C-w>-", { desc = "window height ↑/↓" } },
          { "o", "<C-w>=", { desc = "window fair" } },
        },
      })
      -- }}}
      -- {{{
      local telescope_hint = [[
                 _<space>_: files      _?_: gitfiles
                 _._:  file2      _?_: gitfiles
                 _f_: files       _m_: marks
   🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _o_: old files   _g_: live grep
  🭉🭁🭠🭘    🭣🭕🭌🬾   _p_: projects    _/_: search in file
  🭅█ ▁     █🭐   _a_: all files   _G_: commits
  ██🬿      🭊██   _r_: resume      _z_: undotree
  🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀  _h_: vim help    _c_: execute command
  🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _k_: keymaps     _;_: commands history
                 _O_: options     _?_: search history
  ^
                 _<Enter>_: Telescope           _<Esc>_
  ]]
      Hydra({
        name = "Telescope",
        hint = telescope_hint,
        config = {
          color = "teal",
          invoke_on_body = true,
          hint = {
            position = "middle",
            border = "rounded",
          },
        },
        mode = "n",
        body = "j",
        heads = {
          { "<Space>", cmd("Telescope find_files") },
          { "",        cmd("Telescope git_files") },
          { ".",       cmd("Telecwoc diagnosticsscope find_files") },
          { ".",       cmd("Telecwoc diagnosticsscope find_files") },
          { ".",       cmd("Telecwoc diagnosticsscope find_files") },
          { ".",       cmd("Telecwoc diagnosticsscope find_files") },
          { "f",       cmd("Telescope find_files") },
          { "a",       cmd("Telescope find_files follow=true no_ignore=true hidden=true <CR>") },
          { "g",       cmd("Telescope live_grep") },
          { "o",       cmd("Telescope oldfiles"),                                              { desc =
          "recently opened files" } },
          { "h",       cmd("Telescope help_tags"),                                             { desc = "vim help" } },
          { "m",       cmd("MarksListBuf"),                                                    { desc = "marks" } },
          { "G",       cmd("Telescope git_commits"),                                           { desc = "commits" } },
          { "k",       cmd("Telescope keymaps") },
          { "O",       cmd("Telescope vim_options") },
          { "r",       cmd("Telescope resume") },
          { "R",       cmd('lua require("telescope").extensions.refactoring.refactors()') },
          { "p",       cmd("Telescope projects"),                                              { desc = "projects" } },
          { "/",       cmd("Telescope current_buffer_fuzzy_find"),                             { desc = "search in file" } },
          { "?",       cmd("Telescope search_history"),                                        { desc = "search history" } },
          { ";",       cmd("Telescope command_history"),                                       { desc =
          "command-line history" } },
          { "c",       cmd("Telescope commands"),                                              { desc = "execute command" } },
          { "z",       cmd("Telescope undo"),                                                  { desc = "undotree" } },
          { "<Enter>", cmd("Telescope"),                                                       { exit = true,
            desc = "list all pickers" } },
          { "<Esc>",   nil,                                                                    { exit = true,
            nowait = true } },
          -- 		["lb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
          -- 		["lM"] = { "<cmd> Telescope git_status <CR>", "git status" },
        },
      })
      -- }}}
    end,
  },
  -- }}}
  -- Move {{{
  {
    "rainbowhxch/accelerated-jk.nvim",
    keys = {
      { "n", "<Plug>(accelerated_jk_j)", desc = "down", mode = { "n" } },
      { "e", "<Plug>(accelerated_jk_k)", desc = "up",   mode = { "n" } },
    },
  },
  {
    "haya14busa/vim-edgemotion",
    -- config = function()
    -- require("core.utils").load_mappings("edgemotion")
    -- end,
    keys = {
      { "N", "<Plug>(edgemotion-j)", desc = "edgemotion", mode = { "n", "x", "o" } },
      { "E", "<Plug>(edgemotion-k)", desc = "edgemotion", mode = { "n", "x", "o" } },
    },
  },
  {
    "chaoren/vim-wordmotion",
    lazy = false,
    init = function()
      vim.g.wordmotion_nomap = 1
      local filename = vim.fn.expand("%:p")
      if filename:match("_jp%.md$") then
        vim.api.nvim_set_keymap("n", "i", "<Plug>JaSegmentMoveNW", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("n", "I", "<Plug>JaSegmentMoveNE", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("n", "h", "<Plug>JaSegmentMoveNB", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("n", "H", "ge", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("x", "i", "<Plug>JaSegmentMoveOW", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("x", "I", "<Plug>JaSegmentMoveOE", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("x", "h", "<Plug>JaSegmentMoveOB", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("x", "H", "ge", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("o", "i", "<Plug>JaSegmentMoveXW", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("o", "I", "<Plug>JaSegmentMoveXE", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("o", "h", "<Plug>JaSegmentMoveXB", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("o", "H", "ge", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("o", "si", "<Plug>JaSegmentTextObjI", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("o", "ti", "<Plug>JaSegmentTextObjA", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("x", "si", "<Plug>JaSegmentTextObjVI", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("x", "ti", "<Plug>JaSegmentTextObjVA", { noremap = false, silent = true })
      else
        vim.api.nvim_set_keymap("n", "i", "<Plug>WordMotion_w", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("n", "I", "<Plug>WordMotion_e", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("n", "h", "<Plug>WordMotion_b", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("n", "H", "<Plug>WordMotion_ge", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("x", "i", "<Plug>WordMotion_w", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("x", "I", "<Plug>WordMotion_e", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("x", "h", "<Plug>WordMotion_b", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("x", "H", "<Plug>WordMotion_ge", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("o", "i", "<Plug>WordMotion_w", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("o", "I", "<Plug>WordMotion_e", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("o", "h", "<Plug>WordMotion_b", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("o", "H", "<Plug>WordMotion_ge", { noremap = false, silent = true })
      end
    end,
    dependencies = {
      {
        "deton/jasegment.vim",
        ft = { "jpmd" },
        init = function()
          vim.g["jasegment#model"] = "cabocha"
          vim.g["jasegment_no_default_key_mappings"] = 1
        end,
      },
    },
  },
  { "yuki-yano/fuzzy-motion.vim" },
  {
    "lambdalisue/kensaku.vim",
    lazy = false,
    dependences = {
      "denops.vim",
    },
  },
  {
    "lambdalisue/kensaku-search.vim",
    -- cond = vim.fn.expand('%:p'):match('_jp%.md$') ~= nil,
    event = "CmdlineEnter",
    keys = {
      { "<CR>", "<Plug>(kensaku-search-replace)<CR>", desc = "kensaku", mode = "c" },
    },
    -- init = function()
    --   local filename = vim.fn.expand('%:p')
    --   if filename:match('_jp%.md$') then
    --     vim.api.nvim_set_keymap("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>", { noremap = false, silent = true })
    --   end
    -- end,
    dependencies = { "kensaku.vim" },
  },
  {
    "easymotion/vim-easymotion",
    -- {{{
    event = { "BufRead", "BufNewFile" },
    init = function()
      vim.g.EasyMotion_keys = "NEIHOARSTDLUYFWP;QJ,."
      vim.g.EasyMotion_use_smartsign_us = 1
      vim.g.EasyMotion_do_mapping = 0
      -- Do not shade
      vim.g.EasyMotion_do_shade = 1
      -- Use upper case
      vim.g.EasyMotion_use_upper = 1
      -- Smartcase
      vim.g.EasyMotion_smartcase = 1
      -- Smartsign
      vim.g.EasyMotion_use_smartsign_us = 1
      vim.g.EasyMotion_startofline = 0
      -- Don't skip folded line
      vim.g.EasyMotion_skipfoldedline = 0
      -- pseudo-migemo
      vim.g.EasyMotion_use_migemo = 1
      -- Jump to first with enter & space
      vim.g.EasyMotion_space_jump_first = 1
      -- Prompt
      vim.g.EasyMotion_prompt = "{n}> "
      require("core.utils").load_mappings("easymotion")
    end,
    -- }}}
  },
  {
    "haya14busa/vim-easyoperator-line",
    dependencies = { "vim-easymotion" },
    event = { "BufRead", "BufNewFile" },
    keys = {
      { "dL", "<Plug>(easyoperator-line-delete)", desc = "operator-line", mode = "n" },
      { "cL", "<Plug>(easyoperator-line-yank)",   desc = "operator-line", mode = "n" },
      { "L",  "<Plug>(easyoperator-select)",      desc = "select-lines",  mode = { "o", "n" } },
    },
    init = function()
      vim.g.EasyOperator_line_do_mapping = 0
    end,
  },
  {
    "fedepujol/move.nvim",
    event = { "BufRead", "BufNewFile" },
    keys = {
      { "<A-n>", "<CMD>MoveLine(1)<CR>",    desc = "move", mode = "n" },
      { "<A-e>", "<CMD>MoveLine(-1)<CR>",   desc = "move", mode = "n" },
      { "<A-i>", "<CMD>MoveChar(1)<CR>",    desc = "move", mode = "n" },
      { "<A-h>", "<CMD>MoveChar(-1)<CR>",   desc = "move", mode = "n" },
      { "<A-n>", "<CMD>MoveBlock(1)<CR>",   desc = "move", mode = "v" },
      { "<A-e>", "<CMD>MoveBlock(-1)<CR>",  desc = "move", mode = "v" },
      { "<A-i>", "<CMD>MoveHBlock(1)<CR>",  desc = "move", mode = "v" },
      { "<A-h>", "<CMD>MoveHBlock(-1)<CR>", desc = "move", mode = "v" },
    },
    init = function()
      vim.g.EasyOperator_line_do_mapping = 0
    end,
  },
  -- }}}
  -- Japanese {{{
  {
    "vim-jp/vimdoc-ja",
    event = "CmdLineEnter",
  },
  -- {
  --    keys = {
  --    },
  --  },
  {
    "dnlhc/glance.nvim",
    config = function()
      require("glance").setup({})
    end,
  },
  {
    "vim-denops/denops.vim",
  },
  {
    "vim-skk/skkeleton",
    lazy = false,
    event = "VeryLazy",
    dependencies = { "nvim-cmp", "denops.vim", "delphinus/skkeleton_indicator.nvim", "rinx/cmp-skkeleton" },
    config = function()
      require("skkeleton_indicator").setup()
      require("custom.configs.skk")
    end,
    keys = {
      { "<C-j>", "<Plug>(skkeleton-toggle)", desc = "skk", mode = { "i", "c" } },
    },
  },
  -- }}}
  -- Tools {{{
  {
    "numToStr/Comment.nvim",
    event = { "BufRead", "BufNewFile" },
    init = function()
      require("core.utils").load_mappings("comment")
    end,
    config = function()
      require("Comment").setup({
        {
          padding = true,
          sticky = true,
          opleader = { line = "l", block = "<C-l>" },
          extra = { above = "le", below = "ln", eol = "li" },
          mappings = { basic = true, extra = false },
          pre_hook = nil,
          post_hook = nil,
          ignore = "^$",
          toggler = {
            line = "ll",
            block = "lL",
          },
        },
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "gbprod/substitute.nvim",
    keys = {
      { "R",  "<cmd>lua require('substitute').operator()<cr>", desc = "substitue", mode = { "n", "x" } },
      { "mr", "<cmd>lua require('substitute').line()<cr>",     desc = "substitue", mode = "n" },
    },
    config = function()
      require("substitute").setup()
    end,
  },
  {
    "gbprod/yanky.nvim",
    init = function()
      require("core.utils").load_mappings("yanky")
      require("yanky").setup({
        ring = {
          history_length = 100,
          storage = "shada",
          sync_with_numbered_registers = true,
          cancel_event = "update",
        },
        system_clipboard = {
          sync_with_ring = true,
        },
      })
    end,
  }, --}}}
  -- Replace {{{
  {
    "cshuaimin/ssr.nvim",
    keys = {
      { "<leader>r", "function() require('ssr').open() end", desc = "substitue", mode = { "n", "x" } },
    },
    config = function()
      require("ssr").setup({
        border = "rounded",
        min_width = 50,
        min_height = 5,
        max_width = 120,
        max_height = 25,
        keymaps = {
          close = "q",
          next_match = "n",
          prev_match = "N",
          replace_confirm = "<cr>",
          replace_all = "<leader><cr>",
        },
      })
    end,
  },
  -- }}}
  {
    "nvim-tree/nvim-tree.lua",
    on_attach = function()
      require("custom.configs.nvimtree_map")
    end,
    config = function(on_attach)
      require("nvim-tree").setup({
        on_attach = on_attach,
      })
    end,
  },
  -- Operator {{{
  {
    "machakann/vim-sandwich",
    event = { "BufRead", "BufNewFile" },
    init = function()
      vim.g.operator_sandwich_no_default_key_mappings = 1
      vim.g.textobj_sandwich_no_default_key_mappings = 1
      vim.g.sandwich_no_default_key_mappings = 1
      require("core.utils").load_mappings("sandwich")
    end,
    config = function()
      vim.g["sandwich#recipes"] = vim.list_extend(vim.deepcopy(vim.g["sandwich#default_recipes"]), {
        { buns = { "（", "）" }, input = { "jb" } },
        { buns = { "（", "）" }, input = { "j(" } },
        { buns = { "（", "）" }, input = { "j8" } },
        { buns = { "（", "）" }, input = { "j9" } },
        { buns = { "［", "］" }, input = { "j[" } },
        { buns = { "［", "］" }, input = { "jB" } },
        { buns = { "｛", "｝" }, input = { "j{" } },
        { buns = { "＜", "＞" }, input = { "j<" } },
        { buns = { "＜", "＞" }, input = { "j>" } },
        { buns = { "＜", "＞" }, input = { "ja" } },
        { buns = { "≪", "≫" }, input = { "jA" } },
        { buns = { "「", "」" }, input = { "jk" } },
        { buns = { "『", "』" }, input = { "jK" } },
        { buns = { "〈", "〉" }, input = { "jy" } },
        { buns = { "《", "》" }, input = { "jY" } },
        { buns = { "【", "】" }, input = { "jr" } },
        { buns = { "【", "】" }, input = { "js" } },
        { buns = { "〔", "〕" }, input = { "jt" } },
        { buns = { "{", "}" },     input = { "B" } },
        { buns = { "(", ")" },     input = { "b" } },
        { buns = { "{{", "}}" },   input = { "BB" } },
        { buns = { "((", "))" },   input = { "bb" } },
        { buns = { "'", "'" },     input = { "," } },
        { buns = { '"', '"' },     input = { "." } },
        { buns = { "[", "]" },     input = { ">" } },
        { buns = { "<", ">" },     input = { "<" } },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter" },
    init = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["t<C-f>"] = { query = "@function.outer", desc = "Select outer part of a function region" },
              ["s<C-f>"] = { query = "@function.inner", desc = "Select inner part of a function region" },
              ["t<C-p>"] = { query = "@class.outer", desc = "Select outer part of a class region" },
              ["s<C-p>"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["sl"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },
              ["tl"] = { query = "@loop.outer", desc = "Select outer part of a loop region" },
              ["sP"] = { query = "@parameter.inner", desc = "Select inner part of a parameter region" },
              ["tP"] = { query = "@parameter.outer", desc = "Select outer part of a parameter region" },
              ["sF"] = {
                query = "@conditional.inner",
                desc = "Select inner part of a conditional region",
              },
              ["tF"] = {
                query = "@conditional.outer",
                desc = "Select outer part of a conditional region",
              },
            },
            include_surrounding_whitespace = true,
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["mf"] = "@function.outer",
              ["mc"] = "@class.outer",
            },
            goto_next_end = {
              ["mF"] = "@function.outer",
              ["mC"] = "@class.outer",
            },
            goto_previous_start = {
              ["mp"] = "@function.outer",
              ["mv "] = "@class.outer",
            },
            goto_previous_end = {
              ["mP"] = "@function.outer",
              ["mV"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["m."] = "@parameter.inner",
            },
            swap_previous = {
              ["m,"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },
  {
    "junegunn/vim-easy-align",
    keys = { "ga", "<Plug>(EasyAlign)", desc = "easyalign", mode = { "n", "x" } },
    cmd = "EasyAlign",
  },
  {
    "monaqa/dial.nvim",
    dependencies = "plenary.nvim",
    event = { "BufRead", "BufNewFile" },
    keys = {
      { "<C-z>", "<Plug>(dial-increment)", desc = "increment", mode = { "n", "x" } },
      { "<C-x>", "<Plug>(dial-decrement)", desc = "decrement", mode = { "n", "x" } },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.constant.alias.bool,
          augend.constant.alias.ja_weekday,
          augend.constant.alias.ja_weekday_full,
          augend.date.alias["%H:%M"],
          augend.date.alias["%Y-%m-%d"],
          augend.date.alias["%Y/%m/%d"],
          augend.date.alias["%Y年%-m月%-d日"],
          augend.date.alias["%Y年%-m月%-d日(%ja)"],
          augend.date.alias["%m/%d"],
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.semver.alias.semver,
        },
      })
    end,
  },
  -- Operator }}}
  -- View {{{
  --
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme kanagawa]])
    end,
  },
  {
    "itchyny/vim-highlighturl",
    event = { "BufRead", "BufNewFile" },
  },
  {
    "lambdalisue/readablefold.vim",
    event = { "BufRead", "BufNewFile" },
  },
  {
    "andreadev-it/shade.nvim",
    lazy = true,
    config = function()
      require("custom.plugins.shade")
    end,
  },
  {
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
  },
  -- View}}}
  -- Filetype {{{
  {
    "nathom/filetype.nvim",
    lazy = false,
    init = function()
      require("filetype").setup({
        overrides = {
          literal = {
            [".textlintrc"] = "json",
          },
          complex = {
            [".*git/config"] = "gitconfig", -- Included in the plugin
          },
        },
      })
    end,
  },
  {
    "jsborjesson/vim-uppercase-sql",
    ft = { "sql" },
  },
  {
    "Vimjas/vim-python-pep8-indent",
    ft = { "python" },
  },
  {
    "Decodetalkers/csv-tools.lua",
    ft = "csv",
  },
  {
    "MTDL9/vim-log-highlighting",
    ft = "log",
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/.cache/session", "~/Projects", "~/Downloads", "/" },
        sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
        auto_session_enable_last_session = true,
      })
    end,
  },
  -- Filetype }}}
  -- TODO
  -- https://github.com/nvim-neotest/neotest
  {
    "karb94/neoscroll.nvim",
    init = function()
      require("neoscroll").setup({
        mappings = {},
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
      })
      local t = {}
      t["m<CR>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
      t["<Leader><CR>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
      t["<S-CR>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
      t["<CR>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
      t["<C-CR>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
      -- t["mu"] = { "scroll", { "-0.50", "false", "100" } }
      -- t["my"] = { "scroll", { "0.50", "false", "100" } }
      require("neoscroll.config").set_mappings(t)
    end,
  },
  {
    "danymat/neogen",
    keys = {
      {
        "lg",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  -- bar {{{
  {
    "simrat39/symbols-outline.nvim",
    keys = {
      {
        "<C-t>",
        "<CMD>SymbolsOutline<cr>",
        mode = "n",
      },
    },
    opts = {
      keymaps = {
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "B",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "O",
        fold = "u",
        unfold = "y",
        fold_all = "m",
        unfold_all = "M",
        fold_reset = "R",
      },
    },
  },
  -- }}}
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("notify").setup({
        render = "simple",
        stages = "fade_in_slide_out",
        level = 2,
        time_out = 3,
        top_down = false,
        background_colour = "#121212",
        max_width = 50,
      })
      require("noice").setup({
        notify = {
          enabled = true,
          view = "notify",
        },
        lsp = {
          progress = {
            enabled = true,
            --- @type NoiceFormat|string
            format = "lsp_progress",
            --- @type NoiceFormat|string
            format_done = "lsp_progress_done",
            throttle = 1000 / 30, -- frequency to update lsp progress message
            view = "mini",
          },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,    -- use a classic bottom cmdline for search
          command_palette = true,  -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true,       -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true,   -- add a border to hover docs and signature help
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}

return plugins

-- vim:ts=2:sts=2:et:cc=78:ft=lua
