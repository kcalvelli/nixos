{ self, inputs, zigpkgs, ... }:
{
  perSystem =
    { system, pkgs, ... }:
    {

      packages = {
        inherit (pkgs)
          #brave-browse  
          quickemu
          valent
          zig
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
    #brave-browser = prev.callPackage ./brave-browser { };
    quickemu = prev.callPackage ./quickemu { };
    valent = prev.callPackage ./valent { };
    zig = prev.callPackage ./zig { };
  };
}
