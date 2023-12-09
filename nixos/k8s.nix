{ config, pkgs, ... }:
let
  # When using easyCerts=true the IP Address must resolve to the master on creation.
 # So use simply 127.0.0.1 in that case. Otherwise you will have errors like this https://github.com/NixOS/nixpkgs/issues/59364
  kubeMasterIP = "192.168.2.15";
  kubeMasterHostname = "nixos-k8s-master";
  kubeMasterAPIServerPort = 6443;
in
{
  # resolve master hostname
  networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";

  # packages for administration tasks
  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
  ];

  services.kubernetes = {
    roles = ["master" "node"];
    masterAddress = kubeMasterHostname;
    apiserverAddress = "http://${kubeMasterHostname}:${toString kubeMasterAPIServerPort}";
    apiserver = {
      enable = true;
      securePort = kubeMasterAPIServerPort;
      advertiseAddress = kubeMasterIP;
    };
    flannel.enable = true;

    # use coredns
    addons.dns.enable = true;
    # needed if you use swap
    kubelet.extraOpts = "--fail-swap-on=false";
  };
}