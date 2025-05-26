{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/home
  ];

  networking.hostName = "nixdesktop";
  system.stateVersion = "25.05";
}
