# XFCE desktop environment meant for use with XMonad as a window manager

{ config, lib, pkgs, ... }:

{
  imports = [
    # Window manager
    ../wm/xmonad.nix
  ];

  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        enableXfwm = false;
      };
    };
    displayManager.defaultSession = "xfce+xmonad";
  };
}
