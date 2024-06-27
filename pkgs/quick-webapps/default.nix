{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  cosmic-icons,
  glib,
  gtk3,
  just,
  libxkbcommon,
  makeBinaryWrapper,
  openssl,
  stdenv,
  darwin,
  wayland,
}:

let
  commitDate = "2024-06-05";
in
rustPlatform.buildRustPackage rec {
  pname = "quick-webapps";
  version = "0.4.6";
  src = fetchFromGitHub {
    owner = "elevenhsoft";
    repo = "WebApps";
    rev = "d4dec57191e86822f993fd4d1b931c00f1c9632c";
    hash = "sha256-yjGfL2Z5gR8U/PnFnQnwpqoTXNt0psGlfgfDQVpVKUE=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "accesskit-0.12.2" = "sha256-ksaYMGT/oug7isQY8/1WD97XDUsX2ShBdabUzxWffYw=";
      "atomicwrites-0.4.2" = "sha256-QZSuGPrJXh+svMeFWqAXoqZQxLq/WfIiamqvjJNVhxA=";
      "clipboard_macos-0.1.0" = "sha256-temNg+RdvquSLAdkwU5b6dtu9vZkXjnDASS/eJo2rz8=";
      "cosmic-config-0.1.0" = "sha256-80einOpwpoBsJScgfd0O8yY5AdbjKazh6oQhs/w9L+w=";
      "cosmic-text-0.11.2" = "sha256-K2pZD+pnZvqiowo71ZSotjqiZDw0dZqWZKRLSVF2lCI=";
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

  buildInputs =
    [
      glib
      gtk3
      libxkbcommon
      openssl
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.AppKit
      darwin.apple_sdk.frameworks.CoreFoundation
      darwin.apple_sdk.frameworks.CoreGraphics
      darwin.apple_sdk.frameworks.CoreServices
      darwin.apple_sdk.frameworks.Foundation
      darwin.apple_sdk.frameworks.Metal
      darwin.apple_sdk.frameworks.QuartzCore
      darwin.apple_sdk.frameworks.Security
    ]
    ++ lib.optionals stdenv.isLinux [ wayland ];

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
    "target/${stdenv.hostPlatform.rust.cargoShortTarget}/release/quick-webapps"
  ];

  postFixup = lib.optionalString stdenv.isLinux ''
    wrapProgram $out/bin/${pname} \
      --suffix XDG_DATA_DIRS : "${cosmic-icons}/share" \
      --prefix LD_LIBRARY_PATH : "${
        lib.makeLibraryPath [
          libxkbcommon
          wayland
        ]
      }"
  '';

  meta = with lib; {
    description = "Web App Manager for Cosmic desktop ";
    homepage = "https://github.com/elevenhsoft/WebApps";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ kcalvelli ];
    platforms = platforms.linux;
    mainProgram = "quick-webapps";
  };
}
