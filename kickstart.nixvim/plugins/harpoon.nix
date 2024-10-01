{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;

      keymaps = {
        addFile = "<leader>ha";
        toggleQuickMenu = "<leader>hh";
        navFile = {
          "1" = "<leader>1";
          "2" = "<leader>2";
          "3" = "<leader>3";
          "4" = "<leader>4";
          "5" = "<leader>5";
        };
      };
    };
  };
}
