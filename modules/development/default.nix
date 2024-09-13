{ lib, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    devenv
    nil
    nixfmt-rfc-style
    vim
    starship
    fish
    helix
    gcc
    rustup
    #vscode-fhs    
    inputs.self.packages.${pkgs.system}.zigup
    inputs.self.packages.${pkgs.system}.code-cursor
  ];  

  programs.direnv.enable = true;
  #services.lorri.enable = true;  
  programs.git.enable = true;   
}