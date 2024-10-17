{ lib, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    devenv
    nil
    nixfmt-rfc-style
    vim
    starship
    fish
    gcc
    rustup
    #vscode-fhs    
    inputs.self.packages.${pkgs.system}.zigup
    code-cursor
    nodejs_20
    nodePackages.npm
    nodePackages.typescript
    nodePackages.ts-node
  ];  

  programs.direnv.enable = true;
  services.lorri.enable = true;  
  programs.git.enable = true;   
}