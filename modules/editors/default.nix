{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
    lapce
    vscode
    neovim
  ];

  programs.neovim.enable = true;
}
