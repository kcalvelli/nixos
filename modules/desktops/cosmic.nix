{
  inputs,
  pkgs,
  config,
  utils,
  lib,
  ...
}:

{
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  #Just cosmic
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  # Minimize how bad qt apps look here
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";

  environment.systemPackages = with pkgs; [ 
    adw-gtk3
    qgnomeplatform-qt6
  ];
}
