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
    copier
  ];  

  programs.direnv.enable = true;
  services.lorri.enable = true;  
  programs.git.enable = true;   
}