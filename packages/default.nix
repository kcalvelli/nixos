{ self, inputs, ... }: {
  perSystem = { system, pkgs, ... }: {

   packages = {
    inherit (pkgs)
      brave-browser
      thorium
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
    thorium = prev.callPackage ./thorium { };
  };

}

