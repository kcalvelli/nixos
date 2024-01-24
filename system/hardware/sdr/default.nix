 
{ inputs, config, pkgs, ... }:
{
   hardware.rtl-sdr.enable = true;

   users.users.keith.extraGroups = [ "plugdev" ];

   environment.systemPackages = with pkgs; [
     sdrpp
   ];
}
