{ config, pkgs, ... }:

{
  users.users.chris.isNormalUser = true;
  home-manager.users.chris = { pkgs, ... }: {
  home.packages = with pkgs; [ 
    gnomeExtensions.space-bar
    gnomeExtensions.switcher
  ];
  programs.ghostty = {
    enable = true;
    settings = {
      gtk-titlebar = false;
    };
  };

  qt.enable = true;
  gtk = {
    enable = true;
  };
  dconf.settings = {
    "org/gnome/mutter" = {
      "overlay-key" = ""; # disable plain Super key
    };   # ...
    "org/gnome/shell/extensions/switcher" = {
      show-switcher = ["<Super>space"];
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      # `gnome-extensions list` for a list
      enabled-extensions = with pkgs.gnomeExtensions; [
        space-bar.extensionUuid
        switcher.extensionUuid
      ];
    };
  };
  #qt.platformTheme.name = "gtk";
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

