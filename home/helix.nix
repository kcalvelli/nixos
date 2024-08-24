{ inputs, pkgs, ... }:
{
  programs.helix = {
    enable = true;

    settings = {
      theme = "base16_transparent";
      editor = {
        color-modes = true;
        cursorline = true;
        cursor-share = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides.render = true;
        lsp.display-inlay-hints = true;
        statusline.center = ["position-percentage"];
        true-color = true;
        whitespace.characters = {
          newline = "↴";
          tab = "⇥";
        };
      };

      keys.normal.space.u = {
        f = ":format";
        w = ":set whitespace.render all";
        W = ":set whitespace.render none";
      };
    };
  };
}