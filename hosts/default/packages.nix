{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    fd
    lsd
    ripgrep 
    bat
    lazygit
    fzf
    ghostty
    
    # tooling, helper
    stow
    nh
    btop
    fastfetch
    starship
    killall

    # os stuff
    xdg-desktop-portal-cosmic
    
    # compiling
    gcc

    wgnord

    go-task
    fluxcd
    
    # Hyprland
    hyprpaper
    waybar
    hyprlock
  ];
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
  
  programs.starship = {
    enable = true;
    transientPrompt.enable = true;
  };
  
}

