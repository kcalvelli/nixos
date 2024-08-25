{ inputs, pkgs, ... }:
{
  programs.helix = {
    enable = true;

    settings = {
      theme = "base16_transparent";
      editor = {
        color-modes = true;
        cursorline = true;
        indent-guides.render = true;
        lsp.display-inlay-hints = true;
        statusline.center = ["position-percentage"];
        true-color = true;
        whitespace.characters = {
          newline = "↴";
          tab = "⇥";
        };
        file-picker.hidden = false;
      };
    };
  };
}