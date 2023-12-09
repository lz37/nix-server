{
  inputs = {
    systems.url = "github:nix-systems/x86_64-linux";
    nixpkgs.url = github:NixOS/nixpkgs/nixos-23.05;
  };

  outputs =
    inputs @ { self
    , nixpkgs
    , ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations."nixos-server" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules =
          [
            ./configuration.nix
          ];
      };
    };
}