{
  programs.nixvim = {
    # plugins.avante = {
    #   enable = true;
    #
    #   settings = {
    #     provider = "copilot";
    #     auto_suggestions_provider = "copilot";
    #   };
    # };

    plugins.copilot-lua = {
      enable = true;

      suggestions = {
        enabled = false;
      };

      panels = {
        enabled = false;
      };

      filetypes = {
        yaml = true;
      };
    };

    plugins.copilot-cmp = {
      enable = true;
    };
  };
}
