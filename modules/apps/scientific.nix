{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    cubicsdr  
  ];     
}