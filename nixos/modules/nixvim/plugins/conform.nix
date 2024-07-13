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
      };
    };

  }; 
}
