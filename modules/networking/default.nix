{ inputs, pkgs, ... }:
{
  imports = [
    ./avahi.nix
    #./bridge.nix
    ./samba.nix
    #./zerotier.nix  
    #./hosting.nix
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
    firewall.enable = true;
  };

  services = {
    resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
      extraConfig = ''
        DNSOverTLS=opportunistic
        MulticastDNS=resolve
      '';
      llmnr = true;
    };
    openssh.enable = true;
  };

  programs.mtr.enable = true;
  programs.ssh.startAgent = true;

  # For RTL-SDR
  hardware.rtl-sdr.enable = true;
}
