{ config, pkgs, ... }:
{
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "qt";
    };
  };

  environment.systemPackages = with pkgs; [
    pinentry
  ];
} 
