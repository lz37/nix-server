{ config, pkgs, ... }:

{

  networking = {
    hostName = "nixos-server"; # Define your hostname.
    interfaces.enp6s18.ipv4.addresses = [{
      address = "192.168.2.15";
      prefixLength = 24;
    }];
    defaultGateway = "192.168.2.1";
    nameservers = [ "192.168.2.1" ];
    firewall = {
      enable = false;
    };
    timeServers = [ "192.168.2.1" ];
  };


}