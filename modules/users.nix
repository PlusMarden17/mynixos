{ config, pkgs, ... }:

{
  # User
  users.users.dell = {
    isNormalUser = true;
    description = "DELL";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}