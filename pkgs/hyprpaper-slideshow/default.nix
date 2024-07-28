{ 
  lib,
  stdenv,
  makeWrapper,
  hyprpaper,
}: 
let
  inherit (lib) makeBinPath;
in
  stdenv.mkDerivation rec { 
    name = "hyprpaper-slideshow";
    version = "0.1";

    src = ./hyprpaper-slideshow.sh;

    nativeBuildInputs = [ makeWrapper ];

    buildInputs = [ hyprpaper ];

    unpackCmd = ''
      mkdir hyprpaper-slideshow-src
      cp $curSrc hyprpaper-slideshow-src/hyprpaper-slideshow.sh
    '';

    installPhase = ''
      install -Dm755 hyprpaper-slideshow.sh $out/bin/hyprpaper-slideshow
      wrapProgram $out/bin/hyprpaper-slideshow --prefix PATH : '${makeBinPath buildInputs}'
    '';
  }
