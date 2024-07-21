{ config, pkgs, lib, ...}: 
with lib; let
  cfg = config.languages.rust;
in  
{
  options = {
    languages.rust = {
      enable = mkEnableOption "rust";
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        # Breaking some kind of nix rule - but using rustup
        rustup
      ];
    };  
  };  
}