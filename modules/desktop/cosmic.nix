{ pkgs, inputs, config, lib, ... }:

{
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  options.cosmic = {
    enable = lib.mkEnableOption "Cosmic";
  };
  
  config = lib.mkIf config.cosmic.enable {
    services.desktopManager.cosmic.enable = true;   
    services.displayManager.cosmic-greeter.enable = true;   

    environment.systemPackages = with pkgs; [
      cosmic-forecast
      cosmic-applet-emoji-selector
      cosmic-calculator
      cosmic-player
      cosmic-reader
      cosmic-tasks
    ];
  }; 
}
