{
  programs.nixvim = {
    # Highlight, edit, and navigate code
    # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
    plugins.treesitter = {
      enable = true;

      # TODO: Don't think I need this as nixGrammars is true which should auto install these???
      settings = {
        highlight = {
          enable = true;

          # Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
          additional_vim_regex_highlighting = true;
        };

        indent = {
          enable = true;
          disable = [
            "ruby"
          ];
        };

        # There are additional nvim-treesitter modules that you can use to interact
        # with nvim-treesitter. You should go explore a few and see what interests you:
        #
        #    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        #    - Show your current context: https://nix-community.github.io/nixvim/plugins/treesitter-context/index.html
        #    - Treesitter + textobjects: https://nix-community.github.io/nixvim/plugins/treesitter-textobjects/index.html
      };
    };

    plugins.treesitter-textobjects = {
      enable = true;

      swap = {
        enable = true;

        swapNext = {
          "g>" = {
            desc = "Swap with next parameter";
            query = "@parameter.inner";
          };
        };

        swapPrevious = {
          "g<" = {
            desc = "Swap with previous parameter";
            query = "@parameter.inner";
          };
        };
      };

      move = {
        enable = true;
        gotoNextStart = {
          "]m" = "@function.outer";
          "]c" = "@class.outer";
        };
        gotoNextEnd = {
          "]M" = "@function.outer";
          "]C" = "@class.outer";
        };
        gotoPreviousStart = {
          "[m" = "@function.outer";
          "[c" = "@class.outer";
        };
        gotoPreviousEnd = {
          "[M" = "@function.outer";
          "[C" = "@class.outer";
        };
      };
    };

    plugins.treesitter-context = {
      enable = true;
    };
  };
}
