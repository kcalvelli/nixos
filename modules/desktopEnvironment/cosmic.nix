{ pkgs, inputs, config, lib, ... }:

{
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  options.cosmic = {
    enable = lib.mkEnableOption "Cosmic";
  };
  
  config = lib.mkIf config.cosmic.enable {
    services.desktopManager.cosmic.enable = true;   
    #services.displayManager.cosmic-greeter.enable = true;
  };

  # Minimize how bad qt apps look
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";

  environment.systemPackages = with pkgs; [
    adw-gtk3
    qgnomeplatform-qt6
    qadwaitadecorations
    qadwaitadecorations-qt6
  ];  

  environment.sessionVariables = {
    QT_WAYLAND_DECORATION = "adwaita";
  };  
}
