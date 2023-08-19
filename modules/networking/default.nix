{ inputs, config, pkgs, ... }:
{
  networking = { 
    networkmanager.enable = true;
    networkmanager.dns = "none";
    nameservers = [ "100.100.100.100" "45.90.28.215" "45.90.28.215" ];
    search = [ "taile0fb4.ts.net" ]; 
    # Firewall Config
    #networking.firewall.allowedUDPPorts = [ ... ];
    #networking.firewall.allowedTCPPorts = [ ... ];
    firewall.enable = false;

    # Use iwd instead of wpa_supplicant
    wireless.iwd.enable = true;
    networkmanager.wifi.backend = "iwd";

    # Bridge network
    interfaces.enp39s0.useDHCP = true;
    interfaces.br0.useDHCP = true;
    bridges = {
      "br0" = {
        interfaces = [ "enp39s0" ];
      };
    };
  };

  services = {
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };
    openssh.enable = true;

    tailscale = {
      enable = true;
      useRoutingFeatures = "both";     
    };
  };

  environment.systemPackages = with pkgs; [
    trayscale
  ];  

  programs.mtr.enable = true;

} 
