{ 
  programs.nixvim = {

    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };

    keymaps = [
      {
        mode= "n";
        key = "<leader>o";
        options.silent = true;
        action = ":Neotree toggle<CR>";
      }
      {
        mode= "n";
        key = "<leader>e";
        options.silent = true;
        action = ":Neotree focus<CR>";
      }
      {
        mode = "n";
        key = "<esc>";
        options.silent = true;
        action = ":noh<CR>";
      }
      {
        mode= "n";
        key = "<C-h>";
        options.silent = true;
        action = "<C-w>h";
      }
      {
        mode= "n";
        key = "<C-l>";
        options.silent = true;
        action = "<C-w>l";
      }
      {
        mode= "n";
        key = "<C-j>";
        options.silent = true;
        action = "<C-w>j";
      }
      {
        mode= "n";
        key = "<C-k>";
        options.silent = true;
        action = "<C-w>k";
      }
      {
        mode= "n";
        key = "H";
        options.silent = true;
        action = ":bprev<CR>";
      }
      {
        mode= "n";
        key = "L";
        options.silent = true;
        action = ":bnext<CR>";
      }
      {
        mode = "n";
        key = "<leader>c";
        options.silent = true;
        action = { __raw = ''
          function()
            require('bufdelete').bufdelete(0, true)
          end
          '';
        };
      }
      {
      mode = "x";
      key = "<leader>p";
      action = ''"_dP'';
      options = { desc = "Deletes to void register and paste over"; };
    }

      # Git
      {
        mode = "n";
        key = "<leader>gg";
        options.silent = true;
        action = ":LazyGit<CR>";
      }


    ];
  };
}
