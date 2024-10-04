{
  programs.nixvim = {
    plugins.tmux-navigator = {
      enable = true;

      keymaps = [
        {
          action = "left";
          key = "<A-h>";
          options = {
            desc = "Move to the left pane";
          };
        }
        {
          action = "down";
          key = "<A-j>";
          options = {
            desc = "Move to the bottom pane";
          };
        }
        {
          action = "up";
          key = "<A-k>";
          options = {
            desc = "Move to the top pane";
          };
        }
        {
          action = "right";
          key = "<A-l>";
          options = {
            desc = "Move to the right pane";
          };
        }
      ];

      settings = {
        no_mappings = true;
      };
    };
  };
}
