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
     pkgs.kdePackages.partitionmanager
     
     #Kaccounts
     pkgs.kdePackages.kaccounts-integration
     pkgs.kdePackages.kaccounts-providers

     pkgs.kdePackages.kdeconnect-kde
     pkgs.sshfs 
    ];

    #For KDEConnect
    networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];


  #programs.kdepim.enable = true;
}