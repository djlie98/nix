{
  programs.nixvim = {
    plugins.notify = {
      enable = true;
      
      stages = "fade";
      timeout = 100;
      render = "minimal";
    };
  };
}
