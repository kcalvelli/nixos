{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./common.nix
  ];

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  environment = {
    pathsToLink = [ "/share/pixmaps" ];
    systemPackages = with pkgs; [

    ];
    variables = {
      QT_QPA_PLATFORMTHEME = "kde";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    };
  };
  programs.gnupg.agent.pinentryPackage = lib.mkForce pkgs.pinentry-qt;  
}
