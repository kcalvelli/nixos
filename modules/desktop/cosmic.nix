{ pkgs, inputs, config, lib, ... }:

{
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  options.cosmic = {
    enable = lib.mkEnableOption "Cosmic";
  };
  
  config = lib.mkIf config.cosmic.enable {
    services.desktopManager.cosmic.enable = true;   
    services.displayManager.cosmic-greeter.enable = true;

    # Minimize how bad qt apps look here
    qt.enable = true;
    qt.style = "adwaita-dark";
    qt.platformTheme = "gnome";
  
    environment.systemPackages = with pkgs; [
      adw-gtk3
      qgnomeplatform-qt6
      gnome.gnome-logs
      simple-scan   
      snapshot   
      gnome-calculator
      nautilus
    ];


    # Uncomment if removing GNOME
    # Email
    programs.geary.enable = true;
    services.gnome.evolution-data-server.enable = true;
  
    # Online accounts
    services.gnome.gnome-online-accounts.enable = true;
    
    # Enable GNOME Disks
    programs.gnome-disks.enable = true;
  
    # Keyring support
    programs.seahorse.enable = true;

    # Enable GNOME file stuff
    programs.file-roller.enable = true;
    services.gnome.sushi.enable = true;
  
    environment.sessionVariables.NAUTILUS_4_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
    environment.pathsToLink = [ "/share/nautilus-python/extensions" ];    
  };
}