{ config, pkgs, ... }:

let
  name = "patwoz";
in
{ programs.home-manager.enable = true;

  home.username = name;
  home.homeDirectory = "/Users/${name}";

  home.stateVersion = "24.05";

  home.packages = [
    # pkgs.htop
    pkgs.pinentry-curses
    pkgs.alacritty
    pkgs.tmux
    # https://giters.com/LnL7/nix-darwin/issues/362
    pkgs.entr # https://eradman.com/entrproject/
    # pkgs.nodejs-14_x
    pkgs.ripgrep
    pkgs.fd
    pkgs.delta
    # pkgs.difftastic
    # pkgs.ruby
    pkgs.ncdu
    # pkgs.scrcpy
    pkgs.watchman
    # pkgs.translate-shell
    # pkgs.golangci-lint
    pkgs.imagemagick
    pkgs.awscli2
    pkgs.ffmpeg
    # pkgs.helix # https://github.com/helix-editor/helix
    pkgs.gh # GitHub Client
    pkgs.rsync
    # pkgs.dprint # https://dprint.dev
    # pkgs.rustc
    # pkgs.cargo
    pkgs.hyperfine
    # pkgs.duplicity
    pkgs.nixpacks
    pkgs.sccache
    pkgs.iperf3
    pkgs.kitty
    # pkgs.yabai
    # pkgs.skhd
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
    "${config.home.homeDirectory}/.bin"
    "${config.home.homeDirectory}/.bin/bin"
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
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "completion"
        "history-substring-search"
        "prompt"
        "git"
      ];
    };

    initExtra = "

    plugins=()

 eval \"$(~/.local/bin/mise activate zsh)\"

 # https://github.com/bitwarden/cli/blob/8b650666c593efa19ee54ef7360321de63efe0e2/src/bw.ts#L106
 export BITWARDENCLI_APPDATA_DIR=$HOME/.config/bitwarden-cli
 export GEM_HOME=$(mise exec ruby --command 'ruby -e \"puts Gem.user_dir\"')
 export PATH=$PATH:$GEM_HOME/bin
 . \"$HOME/.cargo/env\"

 export WASMTIME_HOME=\"$HOME/.wasmtime\"
 export PATH=\"$WASMTIME_HOME/bin:$PATH\"

 export GOPATH=$(mise exec go --command 'go env GOPATH')
 export GOROOT=$(mise exec go --command 'go env GOROOT')
 export GOBIN=$(mise exec go --command 'go env GOBIN')
 export PATH=$PATH:$GOPATH/bin
 export PATH=$PATH:$GOROOT/bin
 export PATH=$PATH:$GOBIN
 export PATH=$PATH:$HOME/.maestro/bin
 export PATH=$PATH:$HOME/.flashlight/bin

 export OLLAMA_MODELS=/Volumes/home/AI/Models/ollama
 
 alias dgit=\"git --git-dir ~/.dotfiles/.git --work-tree=$HOME\"
 alias ls=\"exa\"
 alias ll=\"exa -l\"
 alias la=\"exa -a\"
 alias lt=\"exa --tree\"
 alias lla=\"exa -la\"
 
 GPG_TTY=\"$(tty)\"
 export GPG_TTY
 
 export JAVA_HOME=`/usr/libexec/java_home`
 useJava8 () {
   export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
   java -version
 }
 useJava11 () {
   export JAVA_HOME=`/usr/libexec/java_home -v 11.0`
   java -version
 }
 
 export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
 export ANDROID_HOME=$HOME/Library/Android/sdk
 export ANDROID_AVD_HOME=/Volumes/home/VMS/Android-Emulator
 export PATH=$ANDROID_SDK_ROOT/tools:$PATH
 export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
 export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH

 export PATH=$HOME/Library/Python/3.8/bin:$PATH
 # export PATH=$HOME/.bun/bin:$PATH
 
 if [ -f ~/.zshrc_secret ]; then
     source ~/.zshrc_secret
 fi
     ";
  };

  programs.fzf.enable = true;
  programs.fzf.defaultCommand = "fd --type file --hidden --exclude .git";

  programs.bat.enable = true;
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

  programs.gpg = {
    enable = true;
    settings = {
      auto-key-retrieve = true;
      no-emit-version = true;
    };
  };

  #   home.file.".gnupg/gpg-agent.conf".text = ''
  # default-cache-ttl 600
  # max-cache-ttl 7200

  # pinentry-program ${config.home.homeDirectory}/.nix-profile/bin/pinentry-curses
  #   '';

  #   services.gpg-agent = {
  #     enable = true;
  #     defaultCacheTtl = 600;
  #     maxCacheTtl = 7200;
  #     pinentryFlavor = "curses";
  #   };

  #   programs.vscode = {
  #     enable = true;
  #     userSettings = {
  #       "update.channel" = "none";
  #     };
  #   };
}
