{ inputs, pkgs, lib, ... }:
{
  imports = [
    ./avahi.nix
    ./samba.nix
    ./tailscale.nix
  ];

  networking = {
    networkmanager.enable = true;
    useNetworkd = true;
    useDHCP = false;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        5355
      ];
      allowedUDPPorts = [
        5355
      ];
    };
  };

  services = {
    resolved = {
      enable = true;
    };
    openssh.enable = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;
  programs.mtr.enable = true;
  programs.ssh.startAgent = true;

  # For RTL-SDR
  hardware.rtl-sdr.enable = true;
  
  # For KDEConnect protocol
  programs.kdeconnect = {
    enable = true;
    package = inputs.self.packages.${pkgs.system}.valent;
  };

  environment.systemPackages = with pkgs; [
    # Browser, email, etc ...
    #inputs.self.packages.${pkgs.system}.brave-browser-nightly
    brave
    telegram-desktop 
    openssl 
    nextcloud-client
    inputs.self.packages.${pkgs.system}.valent     
  ]; 
  #programs.geary.enable = true;   
  programs.evolution = {
    enable = true;
  };

  # Causes switch to fail if this is not set
  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false; 
}
