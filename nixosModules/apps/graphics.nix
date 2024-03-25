{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    shotwell
    gimp
    loupe
    vulkan-tools   
    glxinfo 
  ];  
}