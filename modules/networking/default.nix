{ inputs, pkgs, ... }:
{
  imports = [
    ./avahi.nix
    ./samba.nix
  ];

  environment.systemPackages = with pkgs; [
    #inputs.self.packages.${pkgs.system}.brave-browser
    brave
    nextcloud-client
    #valent
    telegram-desktop 
    openssl 
  ];

  networking = {
    networkmanager.enable = true;
    useNetworkd = true;
    useDHCP = false;
    firewall = {
      enable = true;
      trustedInterfaces = [
        "tailscale0"
      ];
    };
  };

  services = {
    resolved = {
      enable = true;
      #dnssec = "true";
      #domains = [ "~." ];
      #extraConfig = ''
      #  DNSOverTLS=opportunistic
      #  MulticastDNS=resolve
      #'';
      #llmnr = "true";
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
    openssh.enable = true;
  };

  programs.mtr.enable = true;
  programs.ssh.startAgent = true;

  # For RTL-SDR
  hardware.rtl-sdr.enable = true;
}
