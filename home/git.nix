{ pkgs, ... }:
{
  home.packages = [ pkgs.git ];
  programs.git = {
    enable = true;
    userName  = "keith";
    userEmail = "keith@calvelli.dev";
  };
}