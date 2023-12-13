{ inputs, config, pkgs, ... }:
{
    programs = {
        steam = {
            enable = true;
            gamescopeSession.enable = true;    
        };
    };

    environment.systemPackages = with pkgs; [
        superTuxKart
    ];
} 
