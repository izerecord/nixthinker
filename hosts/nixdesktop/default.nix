{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/home
  ];

  security.sudo.wheelNeedsPassword = false;

  networking.hostName = "nixdesktop";

  system.stateVersion = "25.05";
}
