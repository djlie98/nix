{
  programs.nixvim = {
    # Adds git related signs to the gutter, as well as utilities for managing changes
    # See `:help gitsigns` to understand what the configuration keys do
    # https://nix-community.github.io/nixvim/plugins/gitsigns/index.html
    plugins.gitsigns = {
      enable = true;
      settings = {
        signs = {
          add = {text = "+";};
          change = {text = "~";};
          delete = {text = "_";};
          topdelete = {text = "‾";};
          changedelete = {text = "~";};
        };
      };
    };

    # NOTE: add gitsigns recommended keymaps if you are interested
       # https://nix-community.github.io/nixvim/keymaps/index.html
     keymaps = [
       # Navigation
       {
          mode = "n";
          key = "]c";
          action.__raw = ''
            function()
              if vim.wo.diff then
                vim.cmd.normal { ']c', bang = true }
              else
                require('gitsigns').nav_hunk 'next'
              end
            end
          '';
          options = {
            desc = "Jump to next git [C]hange";
          };
       }
       {
          mode = "n";
          key = "[c";
          action.__raw = ''
            function()
              if vim.wo.diff then
                vim.cmd.normal { '[c', bang = true }
              else
                require('gitsigns').nav_hunk 'prev'
              end
            end
          '';
          options = {
            desc = "Jump to previous git [C]hange";
          };
       }
       # Actions
       # visual mode
       {
          mode = "n";
          key = "<leader>gb";
          action.__raw = ''
            function()
              require('gitsigns').blame_line()
            end
          '';
          options = {
            desc = "git [b]lame line";
          };
       }
       {
          mode = "n";
          key = "<leader>gd";
          action.__raw = ''
            function()
              require('gitsigns').diffthis()
            end
          '';
          options = {
            desc = "git [d]iff against index";
          };
       }
       {
          mode = "n";
          key = "<leader>gD";
          action.__raw = ''
            function()
              require('gitsigns').diffthis '@'
            end
          '';
          options = {
            desc = "git [D]iff against last commit";
          };
       }
       # Toggles
       {
          mode = "n";
          key = "<leader>gb";
          action.__raw = ''
            function()
              require('gitsigns').toggle_current_line_blame()
            end
          '';
          options = {
            desc = "[T]oggle git show [b]lame line";
          };
       }
       {
          mode = "n";
          key = "<leader>gD";
          action.__raw = ''
            function()
              require('gitsigns').toggle_deleted()
            end
          '';
          options = {
            desc = "[T]oggle git show [D]eleted";
          };
       }
     ];
  };
}
