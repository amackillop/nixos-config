# nixos-config
My NixOS configuration files

## Installation
1. Clone this repo.
2. Install home-manager
```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

nix-channel --update

nix-shell '<home-manager>' -A install
```
3. Create symlinks
```
ln -s ~/Development/nixos-config/system/configuration.nix /etc/nixos/configuration.nix

ln -s ~/Development/nixos-config/home/home.nix ~/.config/nixpkgs/home.nix

ln -s ~/Development/nixos-config/home/config.nix ~/.config/nixpkgs/config.nix
```
4. Rebuild environments
```
sudo nixos-rebuild switch
home-manager switch
```
5. Reboot into latest system
