{ inputs, lib, ... }:
{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub-beta";
    location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  }];

  services.flatpak.packages = [
    #{ appId = "com.brave.Browser"; origin = "flathub";  }
    { appId = "com.obsproject.Studio"; origin = "flathub"; }
    { appID = "com.nextcloud.desktopclient.nextcloud"; origin = "flathub"; }
    { appID = "com.github.IsmaelMartinez.teams_for_linux"; origin = "flathub"; }    
    { appID = "com.github.GradienceTeam.Gradience"; origin = "flathub"; }      
  ];  

  services.flatpak.update.onActivation = true;  

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly"; # Default value
  };

 services.flatpak.overrides = {
    global = {
      # Force Wayland by default
      Context.sockets = ["wayland" "!x11" "!fallback-x11"];

      Environment = {
        # Fix un-themed cursor in some Wayland apps
        XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

        # Force correct theme for some GTK apps
        GTK_THEME = "Adw-Gtk3";
      };
    };
  };    
}