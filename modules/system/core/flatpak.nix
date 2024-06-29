{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  
  services = {
    flatpak = { 
      enable = true;
      packages = [
        "com.brave.Browser"
        "com.obsproject.Studio"
        "com.nextcloud.desktopclient.nextcloud"
        "org.telegram.desktop"
        "org.onlyoffice.desktopeditors"
        "org.gnome.Boxes"
        "org.gnome.baobab"
        "org.fedoraproject.MediaWriter"
      ];
      update.auto = {
        enable = true;
        onCalendar = "weekly"; # Default value
      };
      overrides = {
        global = {
          # Force Wayland by default
          Context.sockets = ["wayland" "!x11" "!fallback-x11"];
    
          Environment = {
            # Fix un-themed cursor in some Wayland apps
            XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
    
            # Force correct theme for some GTK apps
            GTK_THEME = "adw-gtk3";
          };
        };
      };
    };
  };
}