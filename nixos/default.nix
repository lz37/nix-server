{ config, pkgs, ... }:

{
  imports =
    [
        ./network.nix
        ./mirror.nix
        ./ssh.nix
        ./locale.nix
        ./nix.nix
        ./boot.nix
        ./users
        ./etc.nix
        ./pkgs
        ./docker.nix
        ./k8s.nix
    ];
}