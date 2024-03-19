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
      brave-browser-nightly
      klassy
      qadwaitadecorations-black
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
    brave-qt = prev.callPackage ./brave-qt { };
    brave-browser-nightly = prev.callPackage ./brave-browser-nightly { };
    klassy = prev.callPackage ./klassy { };
    qadwaitadecorations-black = prev.callPackage ./qadwaitadecorations-black { };
  };

}

