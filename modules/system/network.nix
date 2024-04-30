 { pkgs, ... }:
{
 networking = { 
    networkmanager.enable = true;
    useNetworkd = true;
    useDHCP = false;
    firewall.enable = false;
  };

  #Avahi networking
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

    resolved.enable = true;
    openssh.enable = true;
  };

  programs.mtr.enable = true;

  #Samba
  services.samba = {
    enable = true;
    package = pkgs.samba4Full;
    enableNmbd = false;

    shares.music = {
      path = "/home/keith/Music";
      writable = true;
    };

    shares.pictures = {
      path = "/home/keith/Pictures";
      writable = true;
    }; 

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
  
  environment.systemPackages = with pkgs; [ 
    openssl
  ];
  
  services.samba.openFirewall = true;
  services.avahi.openFirewall = true;
}