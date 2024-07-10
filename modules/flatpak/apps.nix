{ ... }:
{
  # Here be all the apps to install via flatpak
  services.flatpak.packages = [
    #{ appId = "com.brave.Browser"; origin = "flathub";  }
    { appId = "com.obsproject.Studio"; origin = "flathub"; }
    { appId = "com.nextcloud.desktopclient.nextcloud"; origin = "flathub"; }
    { appId = "com.github.IsmaelMartinez.teams_for_linux"; origin = "flathub"; }    
    { appId = "com.github.GradienceTeam.Gradience"; origin = "flathub"; }   
    { appId = "org.gnome.Boxes"; origin = "flathub"; } 
  ];   
}
