{ pkgs, ... }:

{
  services = {
    #  X11
    xserver = {
      enable  = true;
      #videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "us";
        variant = "";
      };
      libinput.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [ 
    libva-utils
    wayland-utils
    vulkan-tools
  ];   
}