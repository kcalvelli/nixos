{
  self,
  inputs,
  ...
}:
{
  perSystem =
    { system, pkgs, ... }:
    {

      packages = {
        inherit (pkgs)
          brave-browser-nightly
          valent
          networkmanagerapplet
          ;
      };

      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [ self.overlays.default ];
      };
    };

  flake.overlays.default = _final: prev: {
    # Custom packages
    brave-browser-nightly = prev.callPackage ./brave-browser-nightly { };
    valent = prev.callPackage ./valent { };
    networkmanagerapplet = prev.callPackage ./networkmanagerapplet { };
  };
}
