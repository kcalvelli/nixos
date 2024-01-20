{ lib
,kernel
,stdenv
}:

stdenv.mkDerivation rec {
  pname = "ft9201 driver";
  version = "0.1";

  src = ./.;

  setSourceRoot = ''
    export sourceRoot=$(pwd)/source
    '';

  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = kernel.makeFlags ++ [
    "-C"
    "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "M=$(sourceRoot)"
  ];

  buildFlags = [ "modules" ];
  installFlags = [ "INSTALL_MOD_PATH=${placeholder "out"}" ];
  installTargets = [ "modules_install" ];

  meta = with lib; {
    description = "FT9201 fingerprint  reader driver";
    platforms = platforms.linux;
  };
}