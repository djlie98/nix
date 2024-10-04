{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      project-nvim = {
        enable = false;
        enableTelescope = true;
        settings = {
          detection_methods = [
            "lsp"
            "pattern"
          ];
        };
      };
    };
  };
}
