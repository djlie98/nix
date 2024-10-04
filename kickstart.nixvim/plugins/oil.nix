{
  programs.nixvim = {
    plugins.oil = {
      enable = true;

      settings = {
        use_default_keymaps = false;
        keymaps = {
          "g?" = "actions.show_help";
          "<CR>" = "actions.select";
          "<C-\\>" = "actions.select_split";
          "<C-\|>" = "actions.select_vsplit";
          "<C-t>" = "actions.select_tab";
          "<C-p>" = "actions.preview";
          "<leader>e" = "actions.close";
          "<C-r>" = "actions.refresh";
          "-" = "actions.parent";
          "_" = "actions.open_cwd";
          "`" = "actions.cd";
          "~" = "actions.tcd";
          "gs" = "actions.change_sort";
          "gx" = "actions.open_external";
          "g." = "actions.toggle_hidden";
        };
        view_options = {
          show_hidden = true;
        };
      };
    };
  };
}
