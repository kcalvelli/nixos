{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    gthumb
    gimp
    loupe
    vulkan-tools   
    glxinfo 
  ];  
}