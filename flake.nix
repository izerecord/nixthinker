{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixthinker = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        inputs.stylix.nixosModules.stylix
      ];
    };
  };
}
