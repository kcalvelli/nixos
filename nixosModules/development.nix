{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
      lorri
      vscode
      git
      jetbrains.rust-rover
      direnv
   ];
}
