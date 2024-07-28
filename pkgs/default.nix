{ self, inputs, zigpkgs, ... }:
{
  perSystem =
    { system, pkgs, ... }:
    {

      packages = {
        inherit (pkgs)
          brave-browser-nightly  
          quickemu
          valent
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
    brave-browser-nightly = prev.callPackage ./brave-browser-nightly { };
    quickemu = prev.callPackage ./quickemu { };
    valent = prev.callPackage ./valent { };
  };
}
