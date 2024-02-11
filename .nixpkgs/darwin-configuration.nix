{ config, pkgs, ... }:

let
  name = "patwoz";
in
{
  imports = [ <home-manager/nix-darwin> ];

  environment.systemPackages = with pkgs; [];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.zsh.enable = true;
  system.stateVersion = 4;

  users.users.${name} = {
    name = name;
    home = "/Users/${name}";
  };

  home-manager.useUserPackages = true;

  # TODO: move all settings from set-defaults.ts to here
  system.defaults.dock.orientation = "right";
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 12;
  system.defaults.NSGlobalDomain.KeyRepeat = 1;
}
