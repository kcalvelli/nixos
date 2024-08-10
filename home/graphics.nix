{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    radeontop
    umr
    gimp
    amdgpu_top
    clinfo
    libcamera
  ];
}