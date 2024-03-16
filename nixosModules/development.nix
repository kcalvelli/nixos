{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
      direnv 
      lorri 
      vscode
      neovim
      grc
      git  
      lapce
      nil
      jetbrains.rust-rover
   ];
}
