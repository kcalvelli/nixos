{ pkgs, inputs, ... }:
{
  imports = [
    ./languages
  ];

  programs.git = {
    enable = true;
    userName = "Keith Calvelli";
    userEmail = "keith@calvelli.dev";
  };

  languages.zig = {
    enable = true;
    package = inputs.self.packages.${pkgs.system}.zig;
    lsp = true;
  };

  languages.rust = {
    enable = true;
  };
}
