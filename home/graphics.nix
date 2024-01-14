{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libva-utils
    wayland-utils
    vulkan-tools
    ]; 
}