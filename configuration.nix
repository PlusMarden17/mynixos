{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/laptop.nix
      ./modules/desktop.nix
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

  # Printer
  services.printing.enable = true;

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User
  users.users.dell = {
    isNormalUser = true;
    description = "DELL";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Programs & Packages
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;
  programs.steam = {
   enable = true;
   remotePlay.openFirewall = true;
   dedicatedServer.openFirewall = true;
  };

  fonts.fontDir.enable = true;

  environment.systemPackages = with pkgs; [
   vscode
   jdk21
   btop
   powertop
   fastfetch
   git
   gnome-software
  ];

  # Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  system.stateVersion = "25.11";
}