{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, cosmic-icons
, glib
, gtk3
, just
, libxkbcommon
, makeBinaryWrapper
, openssl
, stdenv
, darwin
, wayland
}:


let 
  commitDate="2024-05-27";
in 
rustPlatform.buildRustPackage rec {
  pname = "cosmic-webapps";
  version = "0.4.5";
  src = fetchFromGitHub {
    owner = "elevenhsoft";
    repo = "WebApps";
    rev = "a079b0685c7c414b67064e19763dba002675abb5";
    hash = "sha256-xNi+fBX2rfR/FXU/qc7XpG+8HJ9qhpikZZuuLxCQXH8=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "accesskit-0.12.2" = "sha256-ksaYMGT/oug7isQY8/1WD97XDUsX2ShBdabUzxWffYw=";
      "atomicwrites-0.4.2" = "sha256-QZSuGPrJXh+svMeFWqAXoqZQxLq/WfIiamqvjJNVhxA=";
      "clipboard_macos-0.1.0" = "sha256-temNg+RdvquSLAdkwU5b6dtu9vZkXjnDASS/eJo2rz8=";
      "cosmic-config-0.1.0" = "sha256-5VTrZ3c5SEK/PCeQRC3XmSG9wbbET4pyPQum1dmMoCA=";
      "cosmic-files-0.1.0" = "sha256-TdS1M1z63nrtvQ+MSUXv15B3bk6X9f6w1iOL5rrSAoQ=";
      "cosmic-text-0.11.2" = "sha256-Jpgbg1DScteec7ItcGgbQYXu1bBNYJEw1SGsxpcxYfM=";
      "d3d12-0.19.0" = "sha256-usrxQXWLGJDjmIdw1LBXtBvX+CchZDvE8fHC0LjvhD4=";
      "glyphon-0.5.0" = "sha256-j1HrbEpUBqazWqNfJhpyjWuxYAxkvbXzRKeSouUoPWg=";
      "smithay-client-toolkit-0.18.0" = "sha256-/7twYMt5/LpzxLXAQKTGNnWcfspUkkZsN5hJu7KaANc=";
      "smithay-clipboard-0.8.0" = "sha256-MqzynFCZvzVg9/Ry/zrbH5R6//erlZV+nmQ2St63Wnc=";
      "softbuffer-0.4.1" = "sha256-a0bUFz6O8CWRweNt/OxTvflnPYwO5nm6vsyc/WcXyNg=";
      "taffy-0.3.11" = "sha256-SCx9GEIJjWdoNVyq+RZAGn0N71qraKZxf9ZWhvyzLaI=";
      "winit-0.29.10" = "sha256-ScTII2AzK3SC8MVeASZ9jhVWsEaGrSQ2BnApTxgfxK4=";
    };
  };

  # COSMIC applications now uses vergen for the About page
  # Update the COMMIT_DATE to match when the commit was made
  env.VERGEN_GIT_COMMIT_DATE = commitDate;
  env.VERGEN_GIT_SHA = src.rev;

  nativeBuildInputs = [
    just
    pkg-config
    makeBinaryWrapper
  ];

  buildInputs = [
    glib
    gtk3
    libxkbcommon
    openssl
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.AppKit
    darwin.apple_sdk.frameworks.CoreFoundation
    darwin.apple_sdk.frameworks.CoreGraphics
    darwin.apple_sdk.frameworks.CoreServices
    darwin.apple_sdk.frameworks.Foundation
    darwin.apple_sdk.frameworks.Metal
    darwin.apple_sdk.frameworks.QuartzCore
    darwin.apple_sdk.frameworks.Security
  ] ++ lib.optionals stdenv.isLinux [
    wayland
  ];

  postPatch = ''
    substituteInPlace justfile --replace '#!/usr/bin/env' "#!$(command -v env)"
  '';

  dontUseJustBuild = true;

  justFlags = [
    "--set"
    "prefix"
    (placeholder "out")
    "--set"
    "bin-src"
    "target/${stdenv.hostPlatform.rust.cargoShortTarget}/release/cosmic-webapps"
  ];



  postFixup = lib.optionalString stdenv.isLinux ''
    wrapProgram $out/bin/${pname} \
      --suffix XDG_DATA_DIRS : "${cosmic-icons}/share" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ libxkbcommon wayland ]}"
  '';

  meta = with lib; {
    description = "Web App Manager for Cosmic desktop ";
    homepage = "https://github.com/elevenhsoft/WebApps";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ kcalvelli ];
    platforms = platforms.linux;
    mainProgram = "cosmic-webapps";
  };
}