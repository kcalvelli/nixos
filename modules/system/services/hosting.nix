  
{ ... }:
{  
  services.plex = {
    enable = true;
    openFirewall = true;
    user = "keith";
  };

  services = {
    rustdesk-server = {
      enable = true;
      openFirewall = true;
      relayIP = "office";
    };
  };  
}  