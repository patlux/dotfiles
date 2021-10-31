{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [];

  fonts.fonts = with pkgs; [
    meslo-lgs-nf
  ];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.zsh.enable = true;  # default shell on catalina
  system.stateVersion = 4;
}
