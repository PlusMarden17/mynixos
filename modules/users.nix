{ config, pkgs, ... }:

{
  # User
  users.users.dell = {
    isNormalUser = true;
    description = "DELL";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Packages
  environment.systemPackages = with pkgs; [
   vscode
   btop
   fastfetch
   git
   gnome-software

   jdk21
   deno
   scala
   scala-cli
   sbt

   materia-theme
   papirus-icon-theme
  ];

  programs.firefox.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      fuse3
      icu
      nss
      openssl
      curl
      expat
    ];
  };
}