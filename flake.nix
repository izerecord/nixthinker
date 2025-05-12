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

  outputs = { nixpkgs, stylix, ... }@inputs: {
    nixosConfigurations.nixthinker = nixpkgs.lib.nixosSystem {
      #specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
