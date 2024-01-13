{ pkgs, ... }:
{
   home.packages = with pkgs; [ 
      direnv 
      lorri 
      vscode
      neovim
      github-desktop
      github-copilot-cli
      grc  
      cosmic-edit    
   ];

  programs.git = {
    enable = true;
    userName  = "keith";
    userEmail = "keith@calvelli.dev";
  };

}