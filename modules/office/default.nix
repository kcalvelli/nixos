 { confiig, pkgs, ... }:

 {

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebkit-5.212.0-alpha4"
   ];

  environment.systemPackages = with pkgs; [
    calligra 
  ]; 
    
 }
