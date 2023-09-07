 { confiig, pkgs, ... }:

 {
  environment.systemPackages = with pkgs; [
    microsoft-edge-dev
  ]; 
    
 }