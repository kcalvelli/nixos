{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    cubicsdr 
    gnome.gnome-calculator 
  ];     
}