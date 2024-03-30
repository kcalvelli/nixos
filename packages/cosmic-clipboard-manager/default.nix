{ lib
, fetchFromGitHub
, rustPlatform
, dbus
, glib
, just
, libinput
, pkg-config
, pulseaudio
, stdenv
, udev
, util-linux
}:

rustPlatform.buildRustPackage {
  pname = "cosmic-clipboard-manager";
  version = "master";

  src = fetchFromGitHub {
    owner = "wiiznokes";
    repo = "cosmic-clipboard-manager";
    rev = "da4809693a77cd108b75ae04dcefeed411df917b";
    hash = "sha256-B11znI+DJq/xRQeNdgdcavvlQICRBLU6hfBHW2k4NNo=";
  };

  nativeBuildInputs = [ just pkg-config util-linux ];
  buildInputs = [ dbus glib libinput pulseaudio udev ];

  dontUseJustBuild = true;

  justFlags = [
    "--set" "prefix" (placeholder "out")
    "--set" "target" "${stdenv.hostPlatform.rust.cargoShortTarget}/release"
  ];

  meta = with lib; {
    homepage = "https://github.com/wiiznokes/cosmic-clipboard-manager";
    description = "Clipboard manager applet for the COSMIC Desktop Environment";
    license = licenses.mit;
    maintainers = with maintainers; [ kcalvelli ];
    platforms = platforms.linux;
  };
}