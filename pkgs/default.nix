{ self, inputs, ... }: {
  perSystem = { system, pkgs, ... }: {

   packages = {
    inherit (pkgs)
      brave-browser
      quick-webapps
      quickemu
      #cosmic-player
      cursor
      ;
   };


   _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
      overlays = [
        self.overlays.default
      ];
   };
  };

  flake.overlays.default = _final: prev: {
    # Custom packages
    brave-browser = prev.callPackage ./brave-browser { };
    quick-webapps = prev.callPackage ./quick-webapps { };
    quickemu = prev.callPackage ./quickemu { };
    #cosmic-player = prev.callPackage ./cosmic-player { };
    cursor = prev.callPackage ./cursor { };
  };
}
#{ pkgs ? null, final ? null, prev ? null }:
#
#let
#  dir = builtins.readDir ./.;
#  pkgsPaths = builtins.filter (pkgPath: pkgPath != null) (builtins.map (name: if dir.${name} == "directory" then { inherit name; value = "${builtins.toString ./.}/${name}/default.nix"; } else null) (builtins.attrNames dir));
#  callPackage = if final != null then final.callPackage else pkgs.lib.callPackageWith (pkgs // finalPkgs // { buildPackages = finalPkgs; targetPackages = finalPkgs; inherit callPackage; });
#  finalPkgs = builtins.listToAttrs (builtins.map (pkgPath: { inherit (pkgPath) name; value = callPackage pkgPath.value {}; }) pkgsPaths);
#in finalPkgs
