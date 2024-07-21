{ pkgs, inputs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Keith Calvelli";
    userEmail = "keith@calvelli.dev";
  };

  home.packages = with pkgs; [
    devenv
  ];
}
