# XFCE desktop environment with XMonad as a window manager

{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm.enable = true;
      defaultSession = "xfce+xmonad";
    };
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        enableXfwm = false;
      };
    };
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
    # Configure keymap in X11
    layout = "us";
    xkbVariant = "";
    videoDrivers = [ "nvidia" ];
  };
}
