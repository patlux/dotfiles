{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "patrick.wozniak";
  home.homeDirectory = "/Users/patrick.wozniak";

  home.stateVersion = "21.11";

  home.packages = [
    pkgs.htop
    pkgs.exa
    pkgs.pinentry_curses
    pkgs.alacritty
    # https://giters.com/LnL7/nix-darwin/issues/362
    # pkgs.kitty
    pkgs.entr
    # pkgs.nodejs-14_x
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
    pkgs.helix
    pkgs.gh
    pkgs.rsync
  ];

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "lvim";
  };

  home.sessionPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.cargo/bin"
    "${config.home.homeDirectory}/.golang/bin"
    "${config.home.homeDirectory}/.n/bin"
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
      pmodules = [ "environment" "terminal" "editor" "history" "directory" "spectrum" "utility" "completion" "history-substring-search" "prompt" "git" ];
    };

    envExtra = "
export N_PREFIX=\"${config.home.homeDirectory}/.n\"
    ";

    initExtra = "
# https://github.com/bitwarden/cli/blob/8b650666c593efa19ee54ef7360321de63efe0e2/src/bw.ts#L106
export BITWARDENCLI_APPDATA_DIR=$HOME/.config/bitwarden-cli
export GEM_HOME=$(ruby -e \"puts Gem.user_dir\")
export PATH=$PATH:$GEM_HOME/bin

GPG_TTY=\"$(tty)\"
export GPG_TTY

# export JAVA_HOME=`/usr/libexec/java_home`
useJava8 () {
  export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
  java -version
}
useJava11 () {
  export JAVA_HOME=`/usr/libexec/java_home -v 11.0`
  java -version
}

if [ -f ~/.zshrc_secret ]; then
    source ~/.zshrc_secret
fi
    ";
  };

  programs.fzf.enable = true;
  programs.fzf.defaultCommand = "fd --type file --hidden --exclude .git";

  programs.exa.enable = true;
  programs.exa.enableAliases = true;

  programs.bat.enable = true;
  programs.go.enable = true;
  programs.jq.enable = true;

  programs.git = {
    enable = true;
    userName = "Patrick Wozniak";
    userEmail = "email@patwoz.de";
    signing.key = "0D4DE3BE5B9D660B";
    signing.signByDefault = true;
    delta = { enable = true; };
    aliases = { co = "checkout"; ci = "commit"; br = "branch"; pushf = "push --force-with-lease"; };
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

  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    extraPackages = with pkgs; [
      gcc
      rnix-lsp
      tree-sitter
    ];
    #plugins = with pkgs.vimPlugins; [
    #  vim-which-key
    #  nvim-treesitter
    #  nvim-web-devicons
    #  nvim-tree-lua
    #];
  };

  programs.gpg = {
    enable = true;
    settings = {
      auto-key-retrieve = true;
      no-emit-version = true;
    };
  };

  home.file.".gnupg/gpg-agent.conf".text = ''
default-cache-ttl 600
max-cache-ttl 7200

pinentry-program ${config.home.homeDirectory}/.nix-profile/bin/pinentry-curses
  '';

  # services.gpg-agent = {
  #   enable = true;
  #   defaultCacheTtl = 600;
  #   maxCacheTtl = 7200;
  #   pinentryFlavor = "curses";
  # };
  
  programs.vscode = {
    enable = true;
    userSettings = {
      "update.channel" = "none";
    };
  };
}
