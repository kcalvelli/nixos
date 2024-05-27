{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, wrapGAppsHook3
, atk
, cairo
, gdk-pixbuf
, git
, glib
, gtk3
, libsecret
, libxkbcommon
, openssl
, pango
, sqlite
, vulkan-loader
, stdenv
, darwin
, wayland
}:


let 
  commitDate="2024-05-24";
in 
rustPlatform.buildRustPackage rec {
  pname = "WebApps";
  version = "0.4.5";
  src = fetchFromGitHub {
    owner = "elevenhsoft";
    repo = "WebApps";
    rev = "b83a6429acc67039ddcadbccbee0e5bd6cc7c831";
    hash = "sha256-1gyDXuuVt/eKAfA7QsVNhNqQytSlGwq0flxG1mG7GDU=";
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
    pkg-config
    wrapGAppsHook3
  ];

  buildInputs = [
    atk
    cairo
    gdk-pixbuf
    git
    glib
    gtk3
    libsecret
    libxkbcommon
    openssl
    pango
    sqlite
    vulkan-loader
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

  postFixup = lib.optionalString stdenv.isLinux ''
    wrapProgram $out/bin/cosmic-webapps \
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