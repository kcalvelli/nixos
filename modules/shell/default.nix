{ inputs, config, pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    starship
    fish
    wezterm
    neofetch
    grc
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fzf
    fishPlugins.grc
  ];
}