{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    displayManager.lightdm.enable = true;
    desktopManager.budgie.enable = true;
    xkb = {
      layout = "us,ua";
      variant = ",winkeys";
    };
  };
}