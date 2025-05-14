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

    stow

    ghostty
    
    btop
    fastfetch
    starship
    
    gcc
   
    fzf

    go-task
    fluxcd
    
    # Hyprland
    hyprpaper
    waybar
    hyprlock
  ];
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

