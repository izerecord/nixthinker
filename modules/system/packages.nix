{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # terminal stuff
    git
    wget
    fd
    lsd
    ripgrep
    tree
    bat
    lazygit
    fzf

    ghostty
    tmux

    # os conrol tools
    brightnessctl
    # bluetui

    # editors
    zed-editor

    # browser stuff
    tor-browser
    brave
    ff2mpv-rust

    # mail calender etc
    thunderbird
    gnome-calendar
    signal-desktop

    # pw manager
    bitwarden

    # shells
    fish
    bash
    zsh

    # tooling, helper
    stow
    btop
    lm_sensors
    fastfetch
    starship
    killall
    pulseaudio
    pavucontrol
    p7zip
    unrar
    dnsutils

    nextcloud-client

    # document things
    papers

    # image, document editing stuff
    gimp
    inkscape
    pinta
    libreoffice
    digikam

    # windows and gaming stuff
    bottles
    nexusmods-app
    wine

    # nix stuff
    nh
    nil
    nixd
    nixfmt-rfc-style
    nix-index

    # languages
    python3Full
    pdm
    run

    # compiling
    gcc
    cmake
    gnumake
    # stdenv.cc.cc.lib

    # vpn, network things
    # wgnord
    networkmanagerapplet

    # tasks
    just
    just-lsp
    go-task
    fluxcd

    # Hyprland
    hyprpaper
    waybar
    hyprlock
    wofi
    rofi-wayland
    hyprshot

    # theming
    nwg-look
    qt6ct

    # Cosmic
    xdg-desktop-portal-cosmic

    # openssh
    # gvfs
    sshfs

    # media
    spotify
    mpv
    celluloid

    # gaming
    protontricks
    mangohud
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
