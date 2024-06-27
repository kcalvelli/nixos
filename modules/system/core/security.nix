{ ... }:
{ 
  programs = {
    gnupg.agent = {
      enable = true;
    };
  };
  security.polkit.enable = true;
}