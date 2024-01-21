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
    #wireless.iwd.enable = true;
    #networkmanager.wifi.backend = "iwd";
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        domain = true;
        hinfo = true;
        userServices = true;
        workstation = true;
      };
    extraServiceFiles = {
      smb = ''
        <?xml version="1.0" standalone='no'?><!--*-nxml-*-->
        <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
        <service-group>
          <name replace-wildcards="yes">%h</name>
          <service>
            <type>_smb._tcp</type>
            <port>445</port>
          </service>
        </service-group>
      '';
      };
    };
    openssh.enable = true;

    tailscale = {
      enable = true;
      useRoutingFeatures = "both";     
    };
  };

  programs.mtr.enable = true;

  #Samba
  services.samba = {
    enable = true;
    
    # You will still need to set up the user accounts to begin with:
    # $ sudo smbpasswd -a yourusername

    # This adds to the [global] section:
    extraConfig = ''
      browseable = yes
      smb encrypt = required
      wins support = no
      domain master = no
      local master = no
    '';

    shares = {
      homes = {
        browseable = "no";  # note: each home will be browseable; the "homes" share will not.
        "read only" = "no";
        "guest ok" = "no";
      };
    };
  };
  
  
  
  # Curiously, `services.samba` does not automatically open
  # the needed ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 445 139 ];
  networking.firewall.allowedUDPPorts = [ 137 138 ];

  environment.systemPackages = with pkgs; [
    sshfs
  ];
  
} 
