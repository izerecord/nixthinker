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

    # browsers
    tor-browser
    brave

    # mail calender etc
    thunderbird
    gnome-calendar

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

    # nix stuff
    nh
    nil
    nixd
    nixfmt-rfc-style
    nix-index

    # languages
    python3Full

    # compiling
    gcc
    cmake
    gnumake

    # vpn
    wgnord

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
  programs.firefox.nativeMessagingHosts.ff2mpv = true;
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
