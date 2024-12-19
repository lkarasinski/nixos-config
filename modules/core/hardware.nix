{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.enableAllFirmware = true;

  # Add the r8169 driver for RTL8126 5GbE
  boot.kernelModules = config.boot.kernelModules ++ ["r8169"];

  # Add firmware for Qualcomm WiFi 7
  hardware.firmware = with pkgs; [
    linux-firmware
  ];
}
