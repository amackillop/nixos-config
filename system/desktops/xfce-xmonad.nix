# XFCE desktop environment meant for use with XMonad as a window manager

{ config, pkgs, callPackage, ... }:

{
  imports = [
    # Window manager
    ../wm/xmonad.nix
  ];

  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        enable = true;
        greeter.enable = false;
      };
      autoLogin = {
        enable = true;
        user = "unknown";
      };
    };
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        # noDesktop = true;
        enableXfwm = false;
      };
    };
    displayManager.defaultSession = "xfce+xmonad";
  };
}
