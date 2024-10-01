{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    # Plugins
    ./plugins/gitsigns.nix
    ./plugins/which-key.nix
    ./plugins/telescope.nix
    ./plugins/conform.nix
    ./plugins/lsp.nix
    ./plugins/nvim-cmp.nix
    ./plugins/mini.nix
    ./plugins/treesitter.nix
    ./plugins/oil.nix
    ./plugins/project-nvim.nix
    ./plugins/noice.nix
    ./plugins/lazygit.nix
    ./plugins/notify.nix

    # NOTE: Add/Configure additional plugins for Kickstart.nixvim
    #
    #  Here are some example plugins that I've included in the Kickstart repository.
    #  Uncomment any of the lines below to enable them (you will need to restart nvim).
    #
    # ./plugins/kickstart/plugins/debug.nix
    # ./plugins/kickstart/plugins/indent-blankline.nix
    # ./plugins/kickstart/plugins/lint.nix
    # ./plugins/kickstart/plugins/autopairs.nix
    # ./plugins/kickstart/plugins/neo-tree.nix
    #
    # NOTE: Configure your own plugins `see https://nix-community.github.io/nixvim/`
    # Add your plugins to ./plugins/custom/plugins and import them below
  ];

  /*
  =====================================================================
  ==================== READ THIS BEFORE CONTINUING ====================
  =====================================================================
  ========                                    .-----.          ========
  ========         .----------------------.   | === |          ========
  ========         |.-""""""""""""""""""-.|   |-----|          ========
  ========         ||                    ||   | === |          ========
  ========         ||  KICKSTART.NIXVIM  ||   |-----|          ========
  ========         ||                    ||   | === |          ========
  ========         ||                    ||   |-----|          ========
  ========         ||:Tutor              ||   |:::::|          ========
  ========         |'-..................-'|   |____o|          ========
  ========         `"")----------------(""`   ___________      ========
  ========        /::::::::::|  |::::::::::\  \ no mouse \     ========
  ========       /:::========|  |==hjkl==:::\  \ required \    ========
  ========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
  ========                                                     ========
  =====================================================================
  =====================================================================

  What is Kickstart.nixvim?

    Kickstart.nixvim is a starting point for your own configuration.
      The goal is that you can read every line of code, top-to-bottom, understand
      what your configuration is doing, and modify it to suit your needs.

      Once you've done that, you can start exploring, configuring and tinkering to
      make Neovim your own!

      If you don't know anything about Nixvim, Nix or Lua, I recommend taking some time to read through.
        - https://nix-community.github.io/nixvim/
        - https://learnxinyminutes.com/docs/nix/
        - https://learnxinyminutes.com/docs/lua/

  Kickstart.nixvim Guide:

    TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

      If you don't know what this means, type the following:
        - <escape key>
        - :
        - Tutor
        - <enter key>

      (If you already know the Neovim basics, you can skip this step.)

    Once you've completed that, you can continue working through **AND READING** the rest
    of the nixvim.nix.

    Next, run AND READ `:help`.
      This will open up a help window with some basic information
      about reading, navigating and searching the builtin help documentation.

      This should be the first place you go to look when you're stuck or confused
      with something. It's one of my favorite Neovim features.

      MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
      which is very useful when you're not exactly sure of what you're looking for.

    I have left several `:help X` comments throughout the nixvim.nix and the plugin .nix files
      These are hints about where to find more information about the relevant settings,
      plugins or Neovim features used in Kickstart.nixvim.

     NOTE: Look for lines like this

      Throughout the file. These are for you, the reader, to help you understand what is happening.
      Feel free to delete them once you know what you're doing, but they should serve as a guide
      for when you are first encountering a few different constructs in your Nixvim Neovim config.

  If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

  I hope you enjoy your Neovim journey,
  - JMartJonesy

  P.S. You can delete this when you're done too. It's your config now! :)
  */
  programs.nixvim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    defaultEditor = true;

    # You can easily change to a different colorscheme.
    # Add your colorscheme here and enable it.
    # Don't forget to disable the colorschemes you arent using
    #
    # If you want to see what colorschemes are already installed, you can use `:Telescope colorschme`.
    colorschemes = {
      tokyonight = {
        enable = false;
        settings = {
          style = "night";
          transparent = true;
          plugins = {
            telescope = true;
            cmp = true;
            gitsigns = true;
            indent_blankline = true;
            notify = true;
            noice = true;
            treesitter = true;
            treesitter_context = true;
            which-key = true;
            dap = true;
          };
        };
      };

      catppuccin = {
        enable = true;
        settings = {
          flavour = "macchiato";
          integrations = {
            cmp = true;
            gitsigns = true;
            harpoon = true;
            illuminate = true;
            indent_blankline = {
              enabled = false;
              scope_color = "sapphire";
              colored_indent_levels = false;
            };
            mason = true;
            native_lsp = { enabled = true; };
            notify = true;
            nvimtree = true;
            neotree = true;
            symbols_outline = true;
            telescope = true;
            treesitter = true;
            treesitter_context = true;
          };
          transparent_background = true;
        };
      };
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#globals
    globals = {
      # Set <space> as the leader key
      # See `:help mapleader`
      mapleader = " ";
      maplocalleader = " ";

      # Set to true if you have a Nerd Font installed and selected in the terminal
      have_nerd_font = true;
    };

    # [[ Setting options ]]
    # See `:help vim.opt`
    # NOTE: You can change these options as you wish!
    #  For more options, you can see `:help option-list`
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#opts
    opts = {
      # Show line numbers
      number = true;
      # You can also add relative line numbers, to help with jumping.
      #  Experiment for yourself to see if you like it!
      relativenumber = true;

      # Enable mouse mode, can be useful for resizing splits for example!
      mouse = "a";

      # Don't show the mode, since it's already in the statusline
      showmode = false;

      #  See `:help 'clipboard'`
      clipboard = {
        providers = {
          xclip.enable = true;
        };
        register = "unnamedplus";
      };

      # Enable break indent
      breakindent = true;

      # Save undo history
      undofile = true;

      # Case-insensitive searching UNLESS \C or one or more capital letters in search term
      ignorecase = true;
      smartcase = true;

      # Keep signcolumn on by default
      signcolumn = "yes";

      # Decrease update time
      updatetime = 250;

      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      # Sets how neovim will display certain whitespace characters in the editor
      #  See `:help 'list'`
      #  See `:help 'listchars'`
      list = true;
      # NOTE: .__raw here means that this field is raw lua code
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

      # Preview subsitutions live, as you type!
      inccommand = "split";

      # Show which line your cursor is on
      cursorline = true;

      # Minimal number of screen lines to keep above and below the cursor
      scrolloff = 10;

      # See `:help hlsearch`
      hlsearch = true;
    };

    # [[ Basic Keymaps ]]
    #  See `:help vim.keymap.set()`
    # https://nix-community.github.io/nixvim/keymaps/index.html
    keymaps = [
      # Clear highlights on search when pressing <Esc> in normal mode
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      # Open Oil
      {
        mode = "n";
        key = "<leader>e";
        action.__raw = ''
          function()
            require("oil").open()
          end
        '';
      }
      # Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
      # for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
      # is not what someone will guess without a bit more experience.
      #
      # NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
      # or just use <C-\><C-n> to exit terminal mode
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit terminal mode";
        };
      }
      # TIP: Disable arrow keys in normal mode
      /*
      {
        mode = "n";
        key = "<left>";
        action = "<cmd>echo 'Use h to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<right>";
        action = "<cmd>echo 'Use l to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<up>";
        action = "<cmd>echo 'Use k to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<down>";
        action = "<cmd>echo 'Use j to move!!'<CR>";
      }
      */
      # Keybinds to make split navigation easier.
      #  Use CTRL+<hjkl> to switch between windows
      #
      #  See `:help wincmd` for a list of all window commands
      # {
      #   mode = "n";
      #   key = "<C-h>";
      #   action.__raw = ''
      #     function()
      #       vim.cmd("normal! <<")
      #     end
      #   '';
      #   options = {
      #     desc = "Shift Left";
      #   };
      # }
      # {
      #   mode = "n";
      #   key = "<C-l>";
      #   action.__raw = ''
      #     function()
      #       vim.cmd("normal! >>")
      #     end
      #   '';
      #   options = {
      #     desc = "Shift Right";
      #   };
      # }
      # {
      #   mode = "n";
      #   key = "<C-j>";
      #   action = "<cmd>MoveLine(1)<CR>";
      #   options = {
      #     desc = "Shift Down";
      #   };
      # }
      # {
      #   mode = "n";
      #   key = "<C-k>";
      #   action = "<cmd>MoveLine(-1)<CR>";
      #   options = {
      #     desc = "Shift Up";
      #   };
      # }
      #
      # # Shift Selected Lines
      # {
      #   mode = "v";
      #   key = "<C-h>";
      #   action.__raw = ''
      #     function()
      #       vim.cmd("normal! <<")
      #       vim.cmd("normal! gv")
      #     end
      #   '';
      #   options = {
      #     desc = "Shift Left";
      #   };
      # }
      # {
      #   mode = "v";
      #   key = "<C-l>";
      #   action.__raw = ''
      #     function()
      #       vim.cmd("normal! >>")
      #       vim.cmd("normal! gv")
      #     end
      #   '';
      #   options = {
      #     desc = "Shift Right";
      #   };
      # }
      # {
      #   mode = "v";
      #   key = "<C-j>";
      #   action = "<cmd>MoveBlock(1)<CR>";
      #   options = {
      #     desc = "Shift Down";
      #   };
      # }
      # {
      #   mode = "v";
      #   key = "<C-k>";
      #   action = "<cmd>MoveBlock(-1)<CR>";
      #   options = {
      #     desc = "Shift Up";
      #   };
      # }

      # Redo
      {
        mode = "n";
        key = "U";
        action = "<C-r>";
      }

      # Quick Commands
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>w<cr>";
      }
      {
        mode = "n";
        key = "<leader>z";
        action = "<cmd>wq<cr>";
      }

      # Lazygit
      {
        mode = "n";
        key = "<leader>tg";
        action = "<cmd>LazyGitCurrentFile<cr>";
        options = {
          desc = "[T]oggle [L]azygit";
        };
      }
    ];

    # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
    autoGroups = {
      kickstart-highlight-yank = {
        clear = true;
      };
    };

    # [[ Basic Autocommands ]]
    #  See `:help lua-guide-autocommands`
    # https://nix-community.github.io/nixvim/NeovimOptions/autoCmd/index.html
    autoCmd = [
      # Highlight when yanking (copying) text
      #  Try it with `yap` in normal mode
      #  See `:help vim.highlight.on_yank()`
      {
        event = ["TextYankPost"];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
    ];

    plugins = {
      # Detect tabstop and shiftwidth automatically
      # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
      sleuth = {
        enable = true;
      };

      # Highlight todo, notes, etc in comments
      # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
      todo-comments = {
        enable = true;
        settings = {
          signs = true;
        };
      };
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraplugins
    extraPlugins = with pkgs.vimPlugins; [
      # Useful for getting pretty icons, but requires a Nerd Font.

    ];

    extraConfigLua = ''

    '';

    # TODO: Figure out where to move this
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapre
    extraConfigLuaPre = ''

    '';

    # The line beneath this is called `modeline`. See `:help modeline`
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapost
    extraConfigLuaPost = ''
      -- vim: ts=2 sts=2 sw=2 et
    '';
  };
}
