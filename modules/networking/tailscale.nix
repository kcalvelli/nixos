{
  config,
  inputs,
  pkgs,
  ...
}:
{
  networking = {
    firewall = {
      trustedInterfaces = [ config.services.tailscale.interfaceName ];
      allowedUDPPorts = [ config.services.tailscale.port ];
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
