{ pkgs, inputs, ... }:
{
  programs.direnv.enable = true;
  services.lorri.enable = true;

  # Needed to enable fish completions
  programs.fish.enable = true;  
}
