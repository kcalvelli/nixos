{ ... }:
{ 
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
  security.polkit.enable = true;
}