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
     pkgs.kdePackages.signond
     pkgs.kdePackages.kdbusaddons

     #Kio
     pkgs.kdePackages.kio-gdrive
     pkgs.kdePackages.kio-zeroconf

     pkgs.kdePackages.signon-kwallet-extension
     
    ] ++ ( with pkgs.libsForQt5; [
    #I like this theme  
    utterly-round-plasma-style

  ] );

  programs.kdepim.enable = true;
}