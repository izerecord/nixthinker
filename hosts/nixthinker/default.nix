{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/home
  ];

  networking.hostName = "nixthinker";

  system.stateVersion = "25.05";
}
