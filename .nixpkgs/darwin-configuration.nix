{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
      vim
      # neovim
      # kitty
      alacritty
      # exa
      bat
      luarocks
      luajit
    ];

  fonts.fonts = with pkgs; [
    meslo-lgs-nf
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
