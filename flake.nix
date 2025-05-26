{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, stylix, ... }@inputs:
    {
      nixosConfigurations.nixthinker = nixpkgs.lib.nixosSystem {
        #specialArgs = {inherit inputs;};
        modules = [
          ./hosts/nixthinker
          stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.default
        ];
      };
      nixosConfigurations.nixdesktop = nixpkgs.lib.nixosSystem {
        #specialArgs = {inherit inputs;};
        modules = [
          ./hosts/nixdesktop
          stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
