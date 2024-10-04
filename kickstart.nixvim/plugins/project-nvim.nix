{
  programs.nixvim = {
    plugins = {
      project-nvim = {
        enable = true;
        enableTelescope = true;
        settings = {
          detection_methods = [
            "pattern"
          ];

          patterns = [
            ">Projects"
            "=configuration"
            ">.config"
            ">vulcan"
          ];
        };
      };
    };
  };
}
