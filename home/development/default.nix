{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Keith Calvelli";
    userEmail = "keith@calvelli.dev";
};
}