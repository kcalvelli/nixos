{ pkgs, ... }:

{
  services = {
    #  X11
    xserver = {
      enable  = true;
      #videoDrivers = [ "amdgpu" ];
      layout = "us";
      xkbVariant = "";
      libinput.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    xorg.xhost
  ];
}