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
   jdk21
   btop
   fastfetch
   git
   gnome-software
   deno
   scala
   scala-cli
   sbt
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