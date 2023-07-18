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

  programs.mtr.enable = true;

} 
