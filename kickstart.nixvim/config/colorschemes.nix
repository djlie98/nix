{
  programs.nixvim = {
    colorschemes = {
      catppuccin = {
        enable = true;
        settings = {
          flavour = "macchiato";
          integrations = {
            illuminate = true;
            cmp = true;
            gitsigns = true;
            harpoon = true;
            indent_blankline = {
              enabled = false;
              scope_color = "sapphire";
              colored_indent_levels = false;
            };
            mason = true;
            native_lsp = {enabled = true;};
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
  };
}
