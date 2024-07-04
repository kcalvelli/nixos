{ pkgs, inputs, config, lib, ... }:
{
  options.gnome = {
    enable = lib.mkEnableOption "Gnome";
  };

  config = lib.mkIf config.gnome.enable {
    environment = {
      systemPackages = with pkgs; [
        gnome-extension-manager
        cosmic-term
        cosmic-edit
        cosmic-icons
        adw-gtk3
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
    };

    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };    
  };
}