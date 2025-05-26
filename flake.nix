{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    {
      nixosConfigurations.nixthinker = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/nixthinker
        ];
      };
      nixosConfigurations.nixdesktop = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/nixdesktop
        ];
      };
    };
}
