{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    cubicsdr  
    gnome.gnome-calculator
  ];     
}