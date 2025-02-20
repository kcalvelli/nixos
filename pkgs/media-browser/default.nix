{
  lib,
  fetchFromGitHub,
  rustPlatform,
  alsa-lib,
  ffmpeg,
  glib,
  gst_all_1,
  just,
  pkg-config,
  libxkbcommon,
  stdenv,
  cosmic-icons,
  libglvnd,
  libgbm,
  wayland,
  xorg,
  vulkan-loader,
  makeBinaryWrapper,
}:

rustPlatform.buildRustPackage rec {
  pname = "media-browser";
  version = "master";

  src = fetchFromGitHub {
    owner = "fangornsrealm";
    repo = pname;
    #rev = "epoch-${version}";
    hash = "";
  };

  useFetchCargoVendor = true;
  cargoHash = "";

  postPatch = ''
    substituteInPlace justfile --replace '#!/usr/bin/env' "#!$(command -v env)"
  '';

  nativeBuildInputs = [
    just
    pkg-config
    makeBinaryWrapper
  ];

  # Largely based on lilyinstarlight's work linked below
  # https://github.com/lilyinstarlight/nixos-cosmic/blob/main/pkgs/cosmic-player/package.nix

  buildInputs = [
    alsa-lib
    ffmpeg
    glib
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    libxkbcommon
    libgbm
    wayland
    vulkan-loader
    xorg.libX11
    libglvnd
  ];

  dontUseJustBuild = true;

  justFlags = [
    "--set"
    "prefix"
    (placeholder "out")
    "--set"
    "bin-src"
    "target/${stdenv.hostPlatform.rust.cargoShortTarget}/release/cosmic-player"
  ];

  # Force linking to libEGL, which is always dlopen()ed, and to
  # libwayland-client, which is always dlopen()ed except by the
  # obscure winit backend.
  RUSTFLAGS = map (a: "-C link-arg=${a}") [
    "-Wl,--push-state,--no-as-needed"
    "-lEGL"
    "-lwayland-client"
    "-Wl,--pop-state"
  ];

  # LD_LIBRARY_PATH can be removed once tiny-xlib is bumped above 0.2.2
  postInstall = ''
    wrapProgram "$out/bin/cosmic-player" \
      --suffix XDG_DATA_DIRS : "${cosmic-icons}/share" \
      --prefix LD_LIBRARY_PATH : ${
        lib.makeLibraryPath [
          xorg.libX11
          xorg.libXcursor
          xorg.libXi
          vulkan-loader
          libxkbcommon
          wayland
        ]
      }
  '';

  meta = {
    homepage = "https://github.com/fangornsrealm/media-browser";
    description = "Media browser with database backend for the COSMIC desktop environment.";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [  ];
    platforms = lib.platforms.linux;
    mainProgram = "media-browser";
  };
}