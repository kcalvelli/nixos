{ lib, stdenv, fetchurl, wrapGAppsHook, makeWrapper
, alsa-lib
, at-spi2-atk
, at-spi2-core
, atk
, cairo
, cups
, dbus
, dpkg
, expat
, fontconfig
, freetype
, gdk-pixbuf
, glib
, libX11
, libXScrnSaver
, libXcomposite
, libXcursor
, libXdamage
, libXext
, libXfixes
, libXi
, libXrandr
, libXrender
, libXtst
, libdrm
, libkrb5
, libsForQt5
, libuuid
, libxkbcommon
, libxshmfence
, mesa
, nspr
, nss
, pango
, pipewire
, snappy
, udev
, wayland
, xdg-utils
, coreutils
, xorg
, zlib



# command line arguments which are always set e.g "--disable-gpu"
, commandLineArgs ? ""

# Necessary for USB audio devices.
, pulseSupport ? stdenv.isLinux
, libpulseaudio

# For GPU acceleration support on Wayland (without the lib it doesn't seem to work)
, libGL

# For video acceleration via VA-API (--enable-features=VaapiVideoDecoder,VaapiVideoEncoder)
, libvaSupport ? stdenv.isLinux
, libva
, enableVideoAcceleration ? libvaSupport

# For Vulkan support (--enable-features=Vulkan); disabled by default as it seems to break VA-API
, vulkanSupport ? false
, addOpenGLRunpath
, enableVulkan ? vulkanSupport
}:

let
  inherit (lib) optional optionals makeLibraryPath makeSearchPathOutput makeBinPath
    optionalString strings escapeShellArg;

  deps = [
    alsa-lib at-spi2-atk at-spi2-core atk cairo cups dbus expat
    fontconfig freetype gdk-pixbuf glib libdrm libX11 libGL
    libxkbcommon libXScrnSaver libXcomposite libXcursor libXdamage
    libXext libXfixes libXi libXrandr libXrender libxshmfence
    libXtst libuuid mesa nspr nss pango pipewire udev wayland
    xorg.libxcb zlib snappy libkrb5 libsForQt5.qt5.qtbase
  ]
    ++ optional pulseSupport libpulseaudio
    ++ optional libvaSupport libva;

  rpath = makeLibraryPath deps + ":" + makeSearchPathOutput "lib" "lib64" deps;
  binpath = makeBinPath deps;

  enableFeatures = optionals enableVideoAcceleration [ "VaapiVideoDecoder" "VaapiVideoEncoder" "AllowQt" ]
    ++ optional enableVulkan "Vulkan";

    # The feature disable is needed for VAAPI to work correctly: https://github.com/brave/brave-browser/issues/20935
  disableFeatures = optional enableVideoAcceleration "UseChromeOSDirectVideoDecoder";

  pname = "brave-browser-nightly";
in

with import <nixpkgs>{};
stdenv.mkDerivation rec {
  inherit pname;
  version = "1.63.38";

  src = fetchurl {
    url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser-nightly_${version}_amd64.deb";
    sha256 = "1f7lz9b3rwkc8r4nddw3abmz60g68ka4nl3c4ykbvk52yj28w3vd";
  };

  dontConfigure = true;
  dontBuild = true;
  dontPatchELF = true;
  doInstallCheck = true;

  nativeBuildInputs = [
    dpkg
    (wrapGAppsHook.override { inherit makeWrapper; })
  ];

  buildInputs = [
    # needed for XDG_ICON_DIRS
    libsForQt5.breeze-icons
  ];

  unpackPhase = "dpkg-deb --fsys-tarfile $src | tar -x --no-same-permissions --no-same-owner";

  installPhase = ''
      runHook preInstall

      mkdir -p $out $out/bin

      cp -R usr/share $out
      cp -R opt/ $out/opt

      export BINARYWRAPPER=$out/opt/brave.com/brave-nightly/brave-browser-nightly

      # Fix path to bash in $BINARYWRAPPER
      substituteInPlace $BINARYWRAPPER \
          --replace /bin/bash ${stdenv.shell}

      ln -sf $BINARYWRAPPER $out/bin/brave-browser-nightly

      for exe in $out/opt/brave.com/brave-nightly/{brave,chrome_crashpad_handler}; do
          patchelf \
              --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
              --set-rpath "${rpath}" $exe
      done

      # Fix paths
      substituteInPlace $out/share/applications/brave-browser-nightly.desktop \
          --replace /usr/bin/brave $out/bin/brave
      substituteInPlace $out/share/gnome-control-center/default-apps/brave-browser-nightly.xml \
          --replace /opt/brave.com $out/opt/brave.com
      substituteInPlace $out/share/menu/brave-browser-nightly.menu \
          --replace /opt/brave.com $out/opt/brave.com
      substituteInPlace $out/opt/brave.com/brave-nightly/default-app-block \
          --replace /opt/brave.com $out/opt/brave.com

      # Correct icons location
      icon_sizes=("128")

      for icon in ''${icon_sizes[*]}
      do
          mkdir -p $out/share/icons/hicolor/$icon\x$icon/apps
          ln -s $out/opt/brave.com/brave-nightly/product_logo_$icon.png $out/share/icons/hicolor/$icon\x$icon/apps/brave-browser-nightly.png
      done

      # Replace xdg-settings and xdg-mime
      ln -sf ${xdg-utils}/bin/xdg-settings $out/opt/brave.com/brave-nightly/xdg-settings
      ln -sf ${xdg-utils}/bin/xdg-mime $out/opt/brave.com/brave-nightly/xdg-mime

      runHook postInstall
  '';

  preFixup = ''
    # Add command line args to wrapGApp.
    gappsWrapperArgs+=(
      --prefix LD_LIBRARY_PATH : ${rpath}
      --prefix PATH : ${binpath}
      --suffix PATH : ${lib.makeBinPath [ xdg-utils ]}
      ${optionalString (enableFeatures != []) ''
      --add-flags "--enable-features=${strings.concatStringsSep "," enableFeatures}"
      ''}
      ${optionalString (disableFeatures != []) ''
      --add-flags "--disable-features=${strings.concatStringsSep "," disableFeatures}"
      ''}
      --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"
      ${optionalString vulkanSupport ''
      --prefix XDG_DATA_DIRS  : "${addOpenGLRunpath.driverLink}/share"
      ''}
      --add-flags ${escapeShellArg commandLineArgs}
    )
  '';

  installCheckPhase = ''
    # Bypass upstream wrapper which suppresses errors
    $out/opt/brave.com/brave-nightly/brave --version
  '';

  passthru.updateScript = ./update.sh;

  meta = with lib; {
    homepage = "https://brave.com/";
    description = "Privacy-oriented browser for Desktop and Laptop computers";
    changelog = "https://github.com/brave/brave-browser/blob/master/CHANGELOG_DESKTOP.md#" + replaceStrings [ "." ] [ "" ] version;
    longDescription = ''
      Brave browser blocks the ads and trackers that slow you down,
      chew up your bandwidth, and invade your privacy. Brave lets you
      contribute to your favorite creators automatically.
    '';
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    license = licenses.mpl20;
    maintainers = with maintainers; [ uskudnik rht jefflabonte nasirhm ];
    platforms = [ "x86_64-linux" ];
  };
}
