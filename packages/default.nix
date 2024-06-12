{ self, inputs, ... }: {
  perSystem = { system, pkgs, ... }: {

   packages = {
    inherit (pkgs)
      brave-browser
      quick-webapps
      quickemu
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
  };

}

