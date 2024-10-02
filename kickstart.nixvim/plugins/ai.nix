{
  programs.nixvim = {
    plugins.avante = {
      enabled = true;

      settings = {
        provider = "copilot";
        auto_suggestions_provider = "copilot";
      };
    };

    plugins.copilot-lua = {
      enable = true;
    };

    plugins.copilot-cmp = {
      enable = true;
    };
  };
}
