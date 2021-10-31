{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "patrick.wozniak";
  home.homeDirectory = "/Users/patrick.wozniak";

  home.stateVersion = "21.11";

  home.packages = [
    pkgs.git
    pkgs.htop
    pkgs.jq
    pkgs.bat
    pkgs.gnupg
    pkgs.exa
    pkgs.pinentry_mac
    pkgs.alacritty
    # https://giters.com/LnL7/nix-darwin/issues/362
    # pkgs.kitty
    pkgs.entr
    pkgs.nodejs-14_x
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
    pkgs.delta
    pkgs.ruby
    pkgs.ncdu
    # pkgs.scrcpy
    pkgs.watchman
    pkgs.translate-shell
    pkgs.golangci-lint
    pkgs.imagemagick
    pkgs.awscli2
    pkgs.ffmpeg
    pkgs.neovim
  ];

  home.sessionVariables = {
    LANG = "en_US";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "lvim";
  };

  home.sessionPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.cargo/bin"
    "${config.home.homeDirectory}/.golang/bin"
    "${config.home.homeDirectory}/.bin/n/bin"
    "${config.home.homeDirectory}/.bin"
  ];

  home.file.".gemrc".text = ''
gem: --user-install --env-shebang --no-document
  '';

  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "home-manager switch";
      mkdir = "mkdir -p -v";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    }; 

    prezto = {
      enable = true;
      editor = { keymap = "vi"; };
      pmodules = [ "environment" "terminal" "editor" "history" "directory" "spectrum" "utility" "completion" "prompt" "git" ];
    };

    initExtra = "
export GEM_HOME=$(ruby -e \"puts Gem.user_dir\")
export PATH=$PATH:$GEM_HOME/bin
    ";
  };

  programs.fzf = {
    enable = true;
    defaultCommand = "fd --type file --hidden --exclude .git";
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.bat.enable = true;
  programs.go.enable = true;
  programs.jq.enable = true;

  programs.git = {
    enable = true;
    userName = "Patrick Wozniak";
    userEmail = "email@patwoz.de";
    aliases = { co = "checkout"; ci = "commit"; br = "branch"; pushf = "push --force-with-lease"; };
    delta = { enable = true; };
    signing = {
      key = "0D4DE3BE5B9D660B";
      signByDefault = true;
    };
    includes = [
      {
        condition = "gitdir:~/dev/pdg";
      	contents = {
          user = {
            email = "patrick.wozniak.extern@porsche.digital";
            name = "Patrick Wozniak";
            signingKey = "B33CA176B9EF9ECFE39CFCEC1A32081F816CE44F";
          };
          commit = {
            gpgSign = true;
          };
	};
      }
    ];
  };
}
