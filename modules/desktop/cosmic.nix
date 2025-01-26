{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:

{
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  options.cosmic = {
    enable = lib.mkEnableOption "Cosmic";
  };

  config = lib.mkIf config.cosmic.enable {
    services.desktopManager.cosmic.enable = true;
    services.displayManager.cosmic-greeter.enable = true;

    environment.systemPackages = with pkgs; [
      andromeda
      cosmic-ext-applet-clipboard-manager
      cosmic-ext-applet-emoji-selector
      cosmic-ext-calculator
      cosmic-ext-examine
      cosmic-ext-forecast
      cosmic-ext-observatory
      cosmic-ext-tasks
      cosmic-ext-tweaks
      cosmic-player
      cosmic-reader
      stellarshot
      #Overlay of networkmanagerapplet that does not include appindicator
      inputs.self.packages.${pkgs.system}.networkmanagerapplet
    ];

    environment.sessionVariables = {
      COSMIC_DATA_CONTROL_ENABLED = 1;
    };
  };
}
