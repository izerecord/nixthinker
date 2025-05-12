{ config, pkgs, ... }:

{
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
  
  environment.systemPackages = with pkgs; [
    git
    wget
    fd
    lsd
    ripgrep 
    
    #ghostty

    fastfetch
    starship
    
    gcc
    #gnumake
    #cmake
    #libtool
    #unzip
    #pkg-config
    
    #fzf

    go-task
    fluxcd
  ];
}

