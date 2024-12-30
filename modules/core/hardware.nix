{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelModules = ["kvm-amd" "r8125"];

  hardware.firmware = with pkgs; [
    linux-firmware
  ];
}
