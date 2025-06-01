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

  hardware.amdgpu.overdrive.enable = true;
  services.lact.enable = true;

  system.stateVersion = "25.05";
}
