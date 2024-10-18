{
  lib,
  stdenv,
  fetchzip,
}:

stdenv.mkDerivation rec {
  pname = "zigup";
  version = "v2024_05_04";

  src = fetchzip {
    url = "https://github.com/marler8997/zigup/releases/download/v2024_05_04/zigup.ubuntu-latest-x86_64.zip";
    sha256 = "sha256-Nz2A4RBfRmedSKjfby6sXuxX08WqlHFQvZL76bWPH5M=";
  };

  installPhase = ''
    mkdir -p $out/bin
    chmod +x zigup
    install zigup $out/bin
  '';

  meta = with lib; {
    description = "Download and manage zig compilers.";
    homepage = "https://github.com/marler8997/zigup";
    maintainers = with maintainers; [ devins2518 ];
    platforms = platforms.linux;
  };
}
