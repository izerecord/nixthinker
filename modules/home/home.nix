{ pkgs, ... }:

{
  users.users.chris = {
    isNormalUser = true;
    description = "chris";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    # packages = with pkgs; [
    #   #  thunderbird
    # ];
    shell = pkgs.fish;
  };
}
