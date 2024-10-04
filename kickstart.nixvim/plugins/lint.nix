{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs; [
    ];

    # Linting
    # https://nix-community.github.io/nixvim/plugins/lint/index.html
    plugins.lint = {
      enable = true;

      # NOTE: Enabling these will cause errors unless these tools are installed
      lintersByFt = {
        markdown = ["markdownlint"];
        dockerfile = ["hadolint"];
        json = ["jsonlint"];
        terraform = ["tflint"];
        yaml = ["yamllint"];
        typescript = ["eslint_d"];
        javascript = ["eslint_d"];
        python = ["pylint"];
      };

      # Create autocommand which carries out the actual linting
      # on the specified events.
      autoCmd = {
        callback.__raw = ''
          function()
            require('lint').try_lint()
          end
        '';
        group = "lint";
        event = [
          "BufEnter"
          "BufWritePost"
          "InsertLeave"
        ];
      };
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
    autoGroups = {
      lint = {
        clear = true;
      };
    };
  };
}
