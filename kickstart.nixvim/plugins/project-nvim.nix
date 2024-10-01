programs.nixvim = {
  plugins = {
    project-nvim = {
      enable = true;
      enableTelescope = true;
      settings = {
        detection_methods = [
          "lsp"
        ];
      };
    };
  };
};
