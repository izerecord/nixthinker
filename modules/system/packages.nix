{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # terminal stuff
    git
    wget
    fd
    lsd
    ripgrep
    bat
    lazygit
    fzf

    ghostty
    tmux

    # editors
    zed-editor

    # shells
    fish
    bash
    zsh

    # tooling, helper
    stow
    btop
    fastfetch
    starship
    killall

    # nix stuff
    nh
    nil
    nixd
    nixfmt-rfc-style
    nix-index

    # compiling
    gcc
    cmake

    wgnord

    go-task
    fluxcd

    # Hyprland
    hyprpaper
    waybar
    hyprlock
    wofi

    # Cosmic
    xdg-desktop-portal-cosmic

    # media
    spotify
  ];

  programs.command-not-found.enable = false;
  programs.nix-index.enable = true;

  programs.nix-ld.enable = true;
  programs.firefox.enable = true;
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
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
