{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # terminal
    bat
    fd
    fzf
    git
    ghostty
    lazygit
    lsd
    ripgrep
    tmux
    tree
    wget

    # system control tools
    brightnessctl
    # bluetui

    # editors
    zed-editor

    # browsers
    brave
    ff2mpv-rust
    tor-browser

    # mail, calendar, messaging
    gnome-calendar
    signal-desktop
    thunderbird

    # password manager
    bitwarden

    # shells
    bash
    fish
    zsh

    # utilities
    btop
    dnsutils
    fastfetch
    killall
    lm_sensors
    p7zip
    starship
    stow
    unrar

    # audio
    pavucontrol
    pulseaudio

    # sync
    nextcloud-client

    # documents
    papers

    # graphics and office
    digikam
    gimp
    inkscape
    libreoffice
    pinta

    # windows and compatibility
    bottles
    nexusmods-app
    wine

    # nix tooling
    nh
    nil
    nixd
    nixfmt-rfc-style
    nix-index

    # languages
    pdm
    python3
    run

    # build tools
    cmake
    gcc
    gnumake
    # stdenv.cc.cc.lib

    # networking and VPN
    # wgnord
    networkmanagerapplet

    # tasks and orchestration
    fluxcd
    go-task
    just
    just-lsp

    # Hyprland and Wayland
    hyprlock
    hyprpaper
    hyprshot
    rofi
    waybar
    wofi

    # theming
    nwg-look
    qt6ct

    # COSMIC
    xdg-desktop-portal-cosmic

    # remote filesystems
    # gvfs
    sshfs

    # media
    celluloid
    mpv
    spotify

    # gaming utilities
    mangohud
    protontricks
  ];

  programs.command-not-found.enable = false;
  programs.nix-index.enable = true;

  programs.nix-ld.enable = true;
  programs.firefox.enable = true;
  programs.firefox.nativeMessagingHosts.packages = [ pkgs.ff2mpv-rust ];
  programs.thunderbird.enable = true;
  programs.dconf.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    #withNodeJs = true;
    #withPython3 = true;
    #withRuby = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/chris/nixthinker"; # sets NH_OS_FLAKE variable for you
  };

  programs.fzf = {
    fuzzyCompletion = true;
    keybindings = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    transientPrompt.enable = true;
  };

  programs.tmux = {
    enable = true;
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  programs.gamemode.enable = true;
}
