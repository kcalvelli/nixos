{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
#    lapce
    vscode
    neovim
    github-desktop
    github-copilot-cli
    grc
  ];

  programs.neovim.enable = true;
}
