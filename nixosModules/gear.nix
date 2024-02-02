{ inputs, config, pkgs, ... }:
{
    imports = [
      ./kdepim.nix
    ];
    
    environment.systemPackages = with pkgs; [
     #Need these 
     pkgs.kdePackages.kcalc
     pkgs.kdePackages.skanlite
     pkgs.kdePackages.filelight
     pkgs.kdePackages.neochat

     #Kaccounts
     pkgs.kdePackages.kaccounts-integration
     pkgs.kdePackages.kaccounts-providers

     #Kio
     pkgs.kdePackages.kio-gdrive
     pkgs.kdePackages.kio-zeroconf
     
    ] ++ ( with pkgs.libsForQt5; [
    #I like this theme  
    utterly-round-plasma-style
    #signond
  ] );

  programs.kdepim.enable = true;
}