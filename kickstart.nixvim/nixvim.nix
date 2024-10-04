{
  pkgs,
  inputs,
  ...
}: {
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
    ./plugins/lualine.nix
    ./plugins/harpoon.nix
    ./plugins/debug.nix
    ./plugins/indent-blankline.nix
    ./plugins/lint.nix
    ./plugins/ai.nix
    ./plugins/flash.nix
    ./plugins/navigation.nix

    # Config
    ./config/keymaps.nix
    ./config/opts.nix
    ./config/colorschemes.nix
  ];

  programs.nixvim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    defaultEditor = true;

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#globals
    globals = {
      mapleader = " ";
      maplocalleader = " ";

      have_nerd_font = true;
    };

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
      # Highlight todo, notes, etc in comments
      # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
      todo-comments = {
        enable = true;
        settings = {
          signs = true;
        };
      };
    };
  };
}
