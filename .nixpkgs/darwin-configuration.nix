{ config, pkgs, ... }:

let
  name = "patwoz";
in
{
  imports = [ <home-manager/nix-darwin> ];

  environment.systemPackages = with pkgs; [];

  fonts.fonts = with pkgs; [
    meslo-lgs-nf
  ];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.zsh.enable = true;  # default shell on catalina
  system.stateVersion = 4;

  users.users.${name} = {
    name = name;
    home = "/Users/${name}";
  };

  home-manager.useUserPackages = true;
}
