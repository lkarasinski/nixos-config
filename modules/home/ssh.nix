{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/id_ed25519";
        user = "lkarasinski";
      };
      "macbook" = {
        hostname = "192.168.1.3";
        user = "karasinski";
      };
      "proxmox" = {
        hostname = "192.168.1.50";
        user = "lkarasinski";
      };
    };
  };
}
