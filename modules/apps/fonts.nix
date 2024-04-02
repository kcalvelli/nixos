{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    pkgs.ibm-plex  
  ];
}