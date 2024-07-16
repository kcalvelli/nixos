{ pkgs, inputs, ... }:
{
  programs.direnv.enable = true;
  services.lorri.enable = true;
}
