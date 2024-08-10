{ pkgs, ... }:
{
  imports = [
    ./local.nix
    ./nix.nix
  ];

  # Privacy
  programs = {
    gnupg.agent = {
      enable = true;
    };
  };  
}