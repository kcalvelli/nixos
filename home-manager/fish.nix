{ pkgs, nix-your-shell, ... }:

{
  nixpkgs.overlays = [
    nix-your-shell.overlays.default
  ];

  environment.systemPackages = [
    pkgs.nix-your-shell
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    set fish_greeting # Disable greeting
    '';
    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      # Manually packaging and enable a plugin
    ];
    promptInit = ''
      nix-your-shell fish | source
    '';
  };
}