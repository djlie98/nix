{
  programs.nixvim = {
    plugins.noice = {
      enable = true;

      settings = {
        routes = {
          {
            view = "notify";
            filter = {
              event = "msg_showmode"
            };
          }
        };

        lsp = {
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
        };

        presets = {
          bottom_search = true;
          long_message_to_split = true;
          inc_rename = false;
          lsp_doc_border = false;
        };

        views = {
          cmdline_popup = {
            position = {
              row = "50%";
            };
          };
        };
      };
    };
  };
}

