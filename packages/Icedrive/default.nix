{ pkgs, lib, ... }:

let
  pname = "Icedrive";
  version = "2.0";
  name = "Icedrive";

  src = pkgs.fetchurl {
    url = "https://cdn.icedrive.net/static/apps/portable/Icedrive_Portable-x86_64-${version}.AppImage";
    sha256 = "0rd1pr8cbzzgr5ancn8xxma02axy30x1jhgdkgl2ipn3qp7ya74n";
  };

  appimageContents = pkgs.appimageTools.extractType2 { inherit name src; };
in
pkgs.appimageTools.wrapType2 rec {
  inherit name src;

  extraInstallCommands = ''

    install -m 444 -D ${appimageContents}/Icedrive.desktop $out/share/applications/${pname}.desktop

    install -m 444 -D ${appimageContents}/${pname}.png $out/share/icons/hicolor/512x512/apps/${pname}.png

    substituteInPlace $out/share/applications/${pname}.desktop \
    	--replace 'Exec=AppRun --no-sandbox %U' 'Exec=${pname} %U'
  '';

  meta = with lib; {
    description = "Icedrive linux client";
    homepage = "https://icedrive.net/";
    license = licenses.unfree;
    maintainers = [ ];
    platforms = [ "x86_64-linux" ];
  };
}