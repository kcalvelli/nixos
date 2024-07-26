{ pkgs, inputs, config, lib, ... }:
{
  options.gnome = {
    enable = lib.mkEnableOption "Gnome";
  };

  config = lib.mkIf config.gnome.enable {
    environment = {
      systemPackages = with pkgs; [
        gnome-extension-manager
        adw-gtk3
        qgnomeplatform-qt6
        qadwaitadecorations
        qadwaitadecorations-qt6        
      ];

      gnome.excludePackages = 
        (with pkgs; [
          gnome-text-editor
          gnome-console
          gnome-photos
          gnome-tour
          gedit
          epiphany
          totem          
        ])
        ++ (with pkgs.gnome; [
          gnome-music
          gnome-initial-setup
        ]);

      sessionVariables = {
        QT_WAYLAND_DECORATION = "adwaita";
      };          
    };

    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };

    services.gnome = {
      rygel.enable = false;
      gnome-initial-setup.enable = false;  
      at-spi2-core.enable = lib.mkDefault false;
    };
    services.dleyna-renderer.enable = false;
    services.dleyna-server.enable = false;

    # Minimize how bad qt apps look
    qt.enable = true;
    qt.style = "adwaita-dark";
    qt.platformTheme = "gnome";
  };


}
