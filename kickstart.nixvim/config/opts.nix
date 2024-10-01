{
  programs.nixvim = {
    opts = {
      # Show line numbers
      number = true;

      relativenumber = true;

      # Enable mouse mode, can be useful for resizing splits for example!
      mouse = "a";

      # Tab options
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;

      # Enable auto indenting
      cindent = true;
      shiftwidth = 2;

      # Don't show the mode, since it's already in the statusline
      showmode = false;

      # Enable break indent
      breakindent = true;

      # Disable text wrap
      wrap = false;

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

    extraPlugins = with pkgs.vimPlugins; [
      # Useful for getting pretty icons, but requires a Nerd Font.
    ];

    extraConfigLua = ''
      vim.opt.clipboard = "unnamed,unnamedplus"
    '';

    extraConfigLuaPre = ''

    '';

    extraConfigLuaPost = ''

    '';
  };
}
