# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

#{ pkgs ? import <nixpkgs> { } }: rec {

#  # Brave Nightly
#    brave-browser-nightly = pkgs.callPackage ./brave-browser-nightly { };
  # Brave
#    brave = pkgs.callPackage ./brave { }; 
#}
{ self, inputs, ... }: {
  perSystem = { system, pkgs, ... }: {
   packages = {
    inherit (pkgs)
      brave-qt
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
    brave-qt = prev.callPackage ./brave-qt { };
  };
}

