{ lib
, stdenv
, fetchFromGitHub
, kdePackages.wrapQtAppsHook
, cmake
, extra-cmake-modules
, kdePackages.frameworkintegration
, kdePackages.kdecoration
, kdePackages.kirigami
, kdePackages.kcmutils
, qt6
}:

stdenv.mkDerivation rec {
  pname = "klassy";
  version = "plasma6.0";

  src = fetchFromGitHub {
    owner = "paulmcauley";
    repo = "klassy";
    rev = version;
    hash = "sha256-Ee3VHiT+Qf33yKpJ1gQngbqubuorLQMSgd/iZ8bIMp0=";
  };

  buildInputs = [
    kdePackages.frameworkintegration
    kdePackages.kcmutils
    kdePackages.kdecoration
    kdePackages.kirigami2
    kdePackages.qtwayland
    #qt5.qtx11extras
  ];

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    kdePackages.wrapQtAppsHook
  ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_PREFIX=$out"
    "-DCMAKE_BUILD_TYPE=Release"
    "-DBUILD_TESTING=OFF"
    "-DKDE_INSTALL_USE_QT_SYS_PATHS=ON"
  ];

  meta = {
    description = "A highly customizable binary Window Decoration and Application Style plugin for recent versions of the KDE Plasma desktop";
    homepage = "https://github.com/paulmcauley/klassy";
    changelog = "https://github.com/paulmcauley/klassy/releases/tag/${version}";
    license = with lib.licenses; [ bsd3 cc0 fdl12Plus gpl2Only gpl2Plus gpl3Only mit ];
  };
}