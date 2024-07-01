{ pkgs, ... }:
{
  # Office
  environment.systemPackages = with pkgs; [ libreoffice-fresh ];
  programs.evince.enable = true;
}
