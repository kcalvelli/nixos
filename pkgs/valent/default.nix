{ lib
, stdenv
, fetchFromGitHub
, desktop-file-utils
, meson
, ninja
, pkg-config
, wrapGAppsHook4
, evolution-data-server-gtk4
, glib
, glib-networking
, gnutls
, gst_all_1
, json-glib
, libadwaita
, libpeas2
, libportal-gtk4
, pipewire
, sqlite
}:

stdenv.mkDerivation rec {
  pname = "valent";
  version = "0-unstable-2024-07-08";

  src = fetchFromGitHub {
    owner = "andyholmes";
    repo = "valent";
    rev = "0e960cc8245b695d66952f70a0b6288aa84a120b";
    fetchSubmodules = true;
    hash = "sha256-FYdF0mAjZxGdDtm8I9zrMa7uqKFhSLuzZL9U212wQV0=";
  };

  nativeBuildInputs = [
    desktop-file-utils
    meson
    ninja
    pkg-config
    wrapGAppsHook4
  ];

  buildInputs = [
    evolution-data-server-gtk4
    glib
    glib-networking
    gnutls
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    json-glib
    libadwaita
    libpeas2
    libportal-gtk4
    pipewire
    sqlite
  ];

  mesonFlags = [
    "-Dplugin_bluez=true"
    # FIXME: libpeas2 (and libpeas) not compiled with -Dvapi=true
    "-Dvapi=false"
    # Pulseaudio plugin tries to use empty subproject
    "-Dplugin_pulseaudio=false"
  ];

  meta = {
    description = "An implementation of the KDE Connect protocol, built on GNOME platform libraries";
    mainProgram = "valent";
    longDescription = ''
      Note that you have to open firewall ports for other devices
      to connect to it. Use either:
      ```nix
      programs.kdeconnect = {
        enable = true;
        package = pkgs.valent;
      }
      ```
      or open corresponding firewall ports directly:
      ```nix
      networking.firewall = rec {
        allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
        allowedUDPPortRanges = allowedTCPPortRanges;
      }
      ```
    '';
    homepage = "https://valent.andyholmes.ca";
    changelog = "https://github.com/andyholmes/valent/blob/${src.rev}/CHANGELOG.md";
    license = with lib.licenses; [ gpl3Plus cc0 cc-by-sa-30 ];
    maintainers = with lib.maintainers; [ aleksana ];
    platforms = lib.platforms.linux;
  };
}