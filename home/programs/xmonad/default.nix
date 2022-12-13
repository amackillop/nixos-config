{ pkgs, lib, specialArgs, ... }:

{
  home.packages = with pkgs; [
  #   dialog                 # Dialog boxes on the terminal (to show key bindings)
  #   networkmanager_dmenu   # networkmanager on dmenu
  #   networkmanagerapplet   # networkmanager applet
  #   nitrogen               # wallpaper manager
  #   xcape                  # keymaps modifier
  #   xorg.xkbcomp           # keymaps modifier
  #   xorg.xmodmap           # keymaps modifier
  #   xorg.xrandr            # display manager (X Resize and Rotate protocol)
  ];

  xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      # extraPackages = hp: [
      #   hp.dbus
      #   hp.monad-logger
      # ];
      config = ./xmonad.hs;
    };
  };
}
