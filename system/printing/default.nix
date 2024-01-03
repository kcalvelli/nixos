{ inputs, config, pkgs, ... }:
{
  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.hplip pkgs.hplipWithPlugin ];
    };
  };

  environment.systemPackages = with pkgs; [
    hplipWithPlugin
  ];
  
} 
