{
  programs.nixvim = {
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

      # Flash
      {
        mode = "n";
        key = "<leader>jj";
        action.__raw = ''
          function()
          	require("flash").jump()
          end
        '';
        options = {
          desc = "Flash Jump";
        };
      }
      {
        mode = "n";
        key = "<leader>jt";
        action.__raw = ''
          function()
          	require("flash").treesitter()
          end
        '';
        options = {
          desc = "Flash Treesitter";
        };
      }
      {
        mode = "n";
        key = "<leader>jr";
        action.__raw = ''
          function()
          	require("flash").treesitter_search()
          end
        '';
        options = {
          desc = "Flash Treesitter Search";
        };
      }
    ];
  };
}
