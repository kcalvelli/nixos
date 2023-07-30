{ config, pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    neofetch
    direnv
    ripgrep
  ];

  environment.shellInit = ''
    [ -n "$DISPLAY" ] && xhost +si:localuser:$USER || true
  '';
}