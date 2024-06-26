# Expression generated by update.sh; do not edit it by hand!
{ stdenv, callPackage, ... }@args:

callPackage ./make-brave.nix (removeAttrs args [ "callPackage" ]) (
  if stdenv.isAarch64 then
    {
      pname = "brave";
      version = "1.67.116";
      url = "https://github.com/brave/brave-browser/releases/download/v1.67.116/brave-browser_1.67.116_arm64.deb";
      hash = "sha256-YOvfXI+bSX3WZRBYXxGYhNme9NZl3ob/JYw6KshXn54=";
      platform = "aarch64-linux";
    }
  else if stdenv.isx86_64 then
    {
      pname = "brave";
      version = "1.67.116";
      url = "https://github.com/brave/brave-browser/releases/download/v1.67.116/brave-browser_1.67.116_amd64.deb";
      hash = "sha256-J4ap0bEAg5Q40U155AdAyzereBAo8Q/YDedDVqYvaT4=";
      platform = "x86_64-linux";
    }
  else
    throw "Unsupported platform."
)
