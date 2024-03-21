{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  environment = {
    pathsToLink = [ "/share/pixmaps" ];
  #  systemPackages = with pkgs; [
  #
  #  ];
    variables = {
      QT_QPA_PLATFORMTHEME = "kde";
    };
  };
  programs.gnupg.agent.pinentryPackage = lib.mkForce pkgs.pinentry-qt;  
}
