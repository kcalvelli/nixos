{ config, inputs, pkgs, ... }:
let
  tailscaleDns = "100.100.100.100";
  tailnetName = config.services.tailscale.baseDomain;
in
{
  networking = {
    firewall = {
      trustedInterfaces = [
        config.services.tailscale.interfaceName
      ];
      allowedUDPPorts = [
        config.services.tailscale.port
      ];
    };
  };

  services = {
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
      permitCertUid = config.services.caddy.user;
    };
  };
}