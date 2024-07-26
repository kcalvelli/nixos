{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    devenv
  ];

  programs.direnv.enable = true;
  services.lorri.enable = true;  
  programs.git.enable = true; 
}
