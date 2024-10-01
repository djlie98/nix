{
  programs.nixvim = {
    # Collection of various small independent plugins/modules
    # https://nix-community.github.io/nixvim/plugins/mini.html
    plugins.web-devicons = {
      enable = true;
    };

    plugins.mini = {
      enable = true;

      modules = {
        # Better Around/Inside textobjects
        #
        # Examples:
        #  - va)  - [V]isually select [A]round [)]paren
        #  - yinq - [Y]ank [I]nside [N]ext [Q]uote
        #  - ci'  - [C]hange [I]nside [']quote

        move = {
          mappings = {
            left = "<C-h>";
            right = "<C-l>";
            down = "<C-j>";
            up = "<C-k>";

            # Move current line in Normal mode
            line_left = "<C-h>";
            line_right = "<C-l>";
            line_down = "<C-j>";
            line_up = "<C-k>";
          };
        };

        ai = {
          n_lines = 500;
          custom_textobjects = {
            a = {
              __raw = "require('mini.ai').gen_spec.treesitter { a = '@parameter.outer', i = '@parameter.inner' }";
            };
            c = {
              __raw = "require('mini.ai').gen_spec.treesitter { a = '@class.outer', i = '@class.inner' }";
            };
            f = {
              __raw = "require('mini.ai').gen_spec.treesitter { a = '@function.outer', i = '@function.inner' }";
            };
            F = {
              __raw = "require('mini.ai').gen_spec.treesitter { a = '@call.outer', i = '@call.inner' }";
            };
            o = {
              __raw = "require('mini.ai').gen_spec.treesitter { a = { '@block.outer' , '@conditional.outer', '@loop.outer'}, i = { '@block.inner' , '@conditional.inner', '@loop.inner'}, }";
            };
          };
        };

        indentscope = {
        };

        pairs = {
        };

        comment = {
        };

        cursorword = {
        };

        # Add/delete/replace surroundings (brackets, quotes, etc.)
        #
        # Examples:
        #  - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        #  - sd'   - [S]urround [D]elete [']quotes
        #  - sr)'  - [S]urround [R]eplace [)] [']
        surround = {
        };

        # ... and there is more!
        # Check out: https://github.com/echasnovski/mini.nvim
      };
    };

    # You can configure sections in the statusline by overriding their
    # default behavior. For example, here we set the section for
    # cursor location to LINE:COLUMN
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraconfiglu#extraconfiglua
    extraConfigLua = ''

    '';
  };
}
