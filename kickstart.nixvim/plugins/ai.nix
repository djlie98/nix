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

      suggestion = {
        enabled = false;
      };

      panel = {
        enabled = false;
      };
    };

    plugins.copilot-cmp = {
      enable = true;
    };
  };
}
