{pkgs, ...}: {
  system.stateVersion = "24.05";
  time.timeZone = "Europe/Warsaw";

  console.keyMap = "pl2";

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    home-manager
    openconnect
  ];

  programs.ssh.startAgent = true;
  programs.nix-ld.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

  hardware.wooting.enable = true;
}
