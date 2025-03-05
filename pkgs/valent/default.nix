{
  lib,
  stdenv,
  fetchFromGitHub,
  desktop-file-utils,
  meson,
  ninja,
  pkg-config,
  wrapGAppsHook4,
  vala,
  evolution-data-server-gtk4,
  gdk-pixbuf,
  glib,
  glib-networking,
  gnutls,
  gst_all_1,
  json-glib,
  libadwaita,
  libpeas2,
  libphonenumber,
  libportal-gtk4,
  pipewire,
  pulseaudio,
  tinysparql,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "valent";
  version = "1.0.0.alpha.47-unstable-2025-03-04";

  src = fetchFromGitHub {
    owner = "andyholmes";
    repo = "valent";
    rev = "84a75b46869b722b59009478dbc78c2dca22ae30";
    hash = "sha256-zu/0kWXTQar5Nh4mpZ6Qm8kkjeCm5Dj0ecHPYMl2C7U=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    desktop-file-utils
    meson
    ninja
    pkg-config
    wrapGAppsHook4
    vala
  ];

  buildInputs = [
    evolution-data-server-gtk4
    gdk-pixbuf
    glib
    glib-networking
    gnutls
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    json-glib
    libadwaita
    libpeas2
    libphonenumber
    libportal-gtk4
    pipewire
    pulseaudio
    tinysparql
  ];

  mesonFlags = [
    (lib.mesonBool "plugin_bluez" true)
  ];

  meta = {
    description = "Implementation of the KDE Connect protocol, built on GNOME platform libraries";
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
    changelog = "https://github.com/andyholmes/valent/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = with lib.licenses; [
      gpl3Plus
      cc0
      cc-by-sa-30
    ];
    maintainers = with lib.maintainers; [ aleksana ];
    platforms = lib.platforms.linux;
  };
})