{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    cubicsdr  
    qalculate-gtk
  ];     
}