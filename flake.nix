{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:

    let
      pkgs = import nixpkgs {

        system = "x86_64-linux";
        overlays = [ (import ./nix/overlay.nix) ];

      };

    in

    {

      packages.x86_64-linux = {

        default = pkgs.openbabel;

      };

      formatter.x86_64-linux = pkgs.nixpkgs-fmt;

    };
}
