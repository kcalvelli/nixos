{ pkgs, ... }:
{
  #Samba
  services.samba = {
    enable = true;
    package = pkgs.samba;
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
        browseable = "no"; # note: each home will be browseable; the "homes" share will not.
        "read only" = "no";
        "guest ok" = "no";
      };
    };
  };

  services.samba.openFirewall = true;
  services.avahi.openFirewall = true;
}
