{ config, pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    neofetch
    direnv
    ripgrep
    fish
    starship
  ];

  environment.shellInit = ''
    [ -n "$DISPLAY" ] && xhost +si:localuser:$USER || true
  '';
}
