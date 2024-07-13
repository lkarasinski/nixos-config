{
  programs.nixvim.plugins.bufferline = {
    enable = true;
    diagnostics = "nvim_lsp";
    diagnosticsIndicator = ''
      function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " "
          or level:match("warning") and " "
          or level:match("info") and " "
          or level:match("hint") and " "
          or ""
        return icon .. count
      end
    '';
    offsets = [{
      filetype = "neo-tree";
      text = "Files";
      highlight = "Directory";
      separator = true;
    }];
  };
}
