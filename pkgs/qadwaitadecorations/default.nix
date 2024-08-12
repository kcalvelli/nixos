{ lib
, stdenv
, fetchFromGitHub
, cmake
, qt5
, qt6
, wayland
, nix-update-script
, useQt6 ? false

# Shadows support on Qt5 requires the feature backported from Qt6:
# https://src.fedoraproject.org/rpms/qt5-qtwayland/blob/rawhide/f/qtwayland-decoration-support-backports-from-qt6.patch
, qt5ShadowsSupport ? false
}:

let
  qt = if useQt6 then qt6 else qt5;
  qtVersion = if useQt6 then "6" else "5";

in stdenv.mkDerivation (finalAttrs: {
  pname = "qadwaitadecorations";
  version = "main";

  src = fetchFromGitHub {
    owner = "kcalvelli";
    repo = "QAdwaitakDecorations";
    rev = "fd6a73e24f2133899bfe17b69e3f6274dcd9bbc1";
    hash = "sha256-pK4dnO0Qxqb7tQXQBE4xLtOgrTsmQWQhXouy7PCMEvc=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = with qt; [
    qtbase
    qtsvg
    qtwayland
    wayland
  ];

  dontWrapQtApps = true;

  cmakeFlags = [
    "-DQT_PLUGINS_DIR=${placeholder "out"}/${qt.qtbase.qtPluginPrefix}"
  ] ++ lib.optional useQt6 "-DUSE_QT6=true"
    ++ lib.optional qt5ShadowsSupport "-DHAS_QT6_SUPPORT=true";

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Qt${qtVersion} Wayland decoration plugin using libadwaita style with custom colors";
    homepage = "https://github.com/kcalvelli/QBlackPearlGtkDecorations";
    license = lib.licenses.lgpl21Plus;
    maintainers = with lib.maintainers; [ kcalvelli ];
    platforms = lib.platforms.linux;
  };
})