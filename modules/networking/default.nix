{ inputs, pkgs, ... }:
{
  imports = [
    ./avahi.nix
    ./samba.nix
  ];

  environment.systemPackages = with pkgs; [
    #inputs.self.packages.${pkgs.system}.brave-browser
    brave
    telegram-desktop 
    openssl 
    nextcloud-client
    inputs.self.packages.${pkgs.system}.valent
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

  # For KDEConnect protocol
  programs.kdeconnect = {
    enable = true;
    package = inputs.self.packages.${pkgs.system}.valent;
  };

  services = {
    resolved = {
      enable = true;
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
    openssh.enable = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;
  programs.mtr.enable = true;
  programs.ssh.startAgent = true;

  # For RTL-SDR
  hardware.rtl-sdr.enable = true;
}
