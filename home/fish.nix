{ pkgs, ... }:

{
  home.packages = [ pkgs.fish ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    set fish_greeting # Disable greeting
    direnv hook fish | source
    '';
    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "github-copilot-cli-fish"; src = pkgs.fishPlugins.github-copilot-cli-fish.src; }

      # Manually packaging and enable a plugin
    ];
  };
}