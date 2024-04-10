{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    vulkan-tools   
    glxinfo 
  ];  
}