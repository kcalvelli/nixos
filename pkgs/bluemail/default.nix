{ stdenv
, lib
, fetchurl
, dpkg
, autoPatchelfHook
, copyDesktopItems
, pango
, gtk3
, alsa-lib
, nss
, libXdamage
, libdrm
, mesa
, libxshmfence
, makeDesktopItem
, makeWrapper
, wrapGAppsHook
, gcc-unwrapped
, udev
}:

stdenv.mkDerivation rec {
  pname = "bluemail";
  version = "1.136.21-1884";

  # Taking a snapshot of the DEB release because there are no tagged version releases.
  # For new versions, download the upstream release, extract it and check for the version string.
  # In case there's a new version, create a snapshot of it on https://archive.org before updating it here.
  src = fetchurl {
    url = "https://download.bluemail.me/BlueMail/deb/BlueMail.deb";
    sha256 = "11slq4w2mfqin0v2mrdvlq42amyds3yx0z1rqxasjw847d985n9g";
  };

  desktopItems = [
    (makeDesktopItem {
      name = "bluemail";
      icon = "bluemail";
      exec = "bluemail";
      desktopName = "BlueMail";
      comment = meta.description;
      genericName = "Email Reader";
      mimeTypes = [ "x-scheme-handler/me.blueone.linux" "x-scheme-handler/mailto" ];
      categories = [ "Office" ];
    })
  ];

  nativeBuildInputs = [
    autoPatchelfHook
    copyDesktopItems
    makeWrapper
    dpkg
    wrapGAppsHook
  ];

  buildInputs = [
    pango
    gtk3
    alsa-lib
    nss
    libXdamage
    libdrm
    mesa
    libxshmfence
    udev
  ];

  unpackCmd = "${dpkg}/bin/dpkg-deb -x $src debcontents";

  dontBuild = true;
  dontStrip = true;
  dontWrapGApps = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    mv opt/BlueMail/* $out
    ln -s $out/bluemail $out/bin/bluemail

    mkdir -p $out/share/icons
    mv usr/share/icons/hicolor $out/share/icons/

    runHook postInstall
  '';

  makeWrapperArgs = [
    "--prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ gcc-unwrapped.lib gtk3 udev ]}"
    "--prefix PATH : ${lib.makeBinPath [ stdenv.cc ]}"
  ];

  preFixup = ''
    wrapProgram $out/bin/bluemail \
      ''${makeWrapperArgs[@]} \
      ''${gappsWrapperArgs[@]}
  '';

  meta = with lib; {
    description = "Free, secure, universal email app, capable of managing an unlimited number of mail accounts";
    homepage = "https://bluemail.me";
    license = licenses.unfree;
    platforms = platforms.linux;
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    maintainers = with maintainers; [ onny ];
  };
}