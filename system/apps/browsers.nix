{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pkgs.brave-browser-nightly 
    pkgs.brave 
  ];
}