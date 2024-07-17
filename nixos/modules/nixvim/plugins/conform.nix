{
  programs.nixvim.plugins = {
    conform-nvim = {
      enable = true;
      formattersByFt = {
        lua = [ "stylua" ];
        typescriptreact = [ "biome-check" ];
        javascriptreact = [ "biome-check" ];
        typescript = [ "biome-check" ];
        javascript = [ "biome-check" ];
        json = [ "biome-check" ];
        nix = [ "nixpkgs-fmt" ];
      };

      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
      };
    };

    treesitter = {
      enable = true;
    };

    lsp = {
      enable = true;
      servers = {
        tsserver.enable = true;
        lua-ls.enable = true;
        html.enable = true;
        nil-ls.enable = true;
        tailwindcss.enable = true;
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>lr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "ln" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "lp" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  }; 
}
