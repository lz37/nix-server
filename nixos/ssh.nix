{ config, pkgs, ... }:

{

  services = {
    openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        X11Forwarding = true;
        GatewayPorts = "yes";
        PermitRootLogin = "no";
      };
      allowSFTP = true;
      extraConfig = ''
        AllowTcpForwarding yes
        TCPKeepAlive yes
      '';
    };
  };


}