{ inputs, config, pkgs, ... }:
{
    programs = {
        steam.enable = true;
    };

    environment.systemPackages = with pkgs; [
        superTuxKart
    ];
} 
