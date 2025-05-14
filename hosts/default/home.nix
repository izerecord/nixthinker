{ config, pkgs, ... }:

{
  users.users.chris.isNormalUser = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.chris = { pkgs, ... }: {
  home.packages = with pkgs; [ 
  ];

  # stylix waybar
  #stylix.targets.waybar.enableLeftBackColors = true;
  #stylix.targets.waybar.enableCenterBackColors = true;
  stylix.fonts.sizes.desktop = 12;
  
  # Hyprland
  programs.waybar = {
    enable = true;
  };

  services.hyprpaper = {
    enable = true;
  };

  programs.ghostty = {
    enable = true;
    settings = {
      gtk-titlebar = false;
    };
  };
  qt = {
    enable = true;
  };
  gtk = {
    enable = true;
  };
  # This value determines the Home Manager release that your configuration is 
  # compatible with. This helps avoid breakage when a new Home Manager release 
  # introduces backwards incompatible changes. 
  #
  # You should not change this value, even if you update Home Manager. If you do 
  # want to update the value, then make sure to first check the Home Manager 
  # release notes. 
  home.stateVersion = "24.11"; # Please read the comment before changing. 

  };
}

