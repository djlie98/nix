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

        ai = {};

        # ai.__raw = ''
        #     function()
        #       local spec_treesitter = require('mini.ai').gen_spec.treesitter;
        #   return {
        #   n_lines = 500;
        #   custom_textobjects = {
        #         a = spec_treesitter { a = '@parameter.outer', i = '@parameter.inner' },
        #         c = spec_treesitter { a = '@class.outer', i = '@class.inner' },
        #         f = spec_treesitter { a = '@function.outer', i = '@function.inner' },
        #         F = spec_treesitter { a = '@call.outer', i = '@call.inner' },
        #         o = spec_treesitter { a = { '@block.outer' , '@conditional.outer', '@loop.outer'}, i = { '@block.inner' , '@conditional.inner', '@loop.inner'}, },
        #       }
        # };
        #     end
        # '';

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

        # Simple and easy statusline.
        #  You could remove this setup call if you don't like it,
        #  and try some other statusline plugin
        statusline = {
          use_icons.__raw = "vim.g.have_nerd_font";
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
      require('mini.statusline').section_location = function()
        return '%2l:%-2v'
      end
    '';
  };
}
