{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ 
      direnv 
      lorri 
      vscode
      neovim
      github-desktop
      github-copilot-cli
      grc   
      git  
   ];
}