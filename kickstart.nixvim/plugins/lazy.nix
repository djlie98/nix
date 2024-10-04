{
  programs.nixvim = {
    plugins.lazy = {
      enable = true;

      plugins = [
        {
          name = "coffebar/neovim-project";
          enabled = true;

          opts.__raw = ''
            {
              projects = {
                "~/Projects/*",
                "~/.config/*",
                "~/configuration/"
              }
            }
          '';

          init.__raw = ''
            function()
              vim.opt.sessionoptions:append("globals")
            end
          '';

          dependencies = [
            {
              name = "nvim-lua/plenary.nvim";
              enabled = true;
            }
            {
              name = "nvim-telescope/telescope.nvim";
              enabled = true;
            }
            {
              name = "Shatur/neovim-session-manager";
              enabled = true;
            }
          ];
        }
      ];
    };
    keymaps = [
      {
        mode = "n";
        keys = "<leader>fp";
        action = "<cmd>Telescope neovim-project discover<cr>";
        options = {
          desc = "[F]ind [P]roject";
        };
      }
    ];
  };
}
