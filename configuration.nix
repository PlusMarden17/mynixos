{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/laptop.nix
      ./modules/desktop.nix
      ./modules/services.nix
      ./modules/users.nix
    ];

  # System settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Kyiv";

  # Localization
  i18n.defaultLocale = "uk_UA.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ALL = "uk_UA.UTF-8";
  };

  # Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;

  # Version
  system.stateVersion = "25.11";
}