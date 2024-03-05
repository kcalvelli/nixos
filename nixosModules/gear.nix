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
     
     #Kaccounts
     pkgs.kdePackages.kaccounts-integration
     pkgs.kdePackages.kaccounts-providers
     
    ] ++ ( with pkgs.libsForQt5; [
    #I like this theme  
    utterly-round-plasma-style

  ] );

  #programs.kdepim.enable = true;
}