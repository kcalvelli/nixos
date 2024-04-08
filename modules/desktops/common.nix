{ pkgs, inputs, ... }:

{
  services = {
    #  X11
    xserver = {
      enable  = true;
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "us";
        variant = "";
      };
      libinput.enable = true;
    };
  };

  # How about some privacy? 
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  services= {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      };

    printing = {
      enable = true;
      drivers = [ pkgs.hplip pkgs.hplipWithPlugin ];
    };      
  };

  sound.enable = true;
  security.rtkit.enable = true; 
  security.polkit.enable = true;
  fonts.fontconfig.enable = true;
}
