# Expression generated by update.sh; do not edit it by hand!
{ stdenv, callPackage, ... }@args:

callPackage ./make-brave-nightly.nix (removeAttrs args [ "callPackage" ])
  (
    if stdenv.isAarch64 then
      {
        pname = "brave-browser-nightly";
        version = "1.77.58";
        url = "https://github.com/brave/brave-browser/releases/download/v1.77.58/brave-browser-nightly_1.77.58_arm64.deb";
        hash = "sha256-SJDW7cQ+ksCh8xhMksMnSOSDbvV/Qawwy1FMRxQz0ME=";
        platform = "aarch64-linux";
      }
    else if stdenv.isx86_64 then
      {
        pname = "brave-browser-nightly";
        version = "1.77.58";
        url = "https://github.com/brave/brave-browser/releases/download/v1.77.58/brave-browser-nightly_1.77.58_amd64.deb";
        hash = "sha256-0JGb26t6UQaWSe+tm7ej6Nv1eqO8qppPCY0fzWPuFeQ=";
        platform = "x86_64-linux";
      }
    else
      throw "Unsupported platform."
  )
