{
  self,
  inputs,
  zigpkgs,
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
          zigup
          networkmanagerapplet
          system76-power
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
    zigup = prev.callPackage ./zigup { };
    networkmanagerapplet = prev.callPackage ./networkmanagerapplet { };
    system76-power = prev.callPackage ./system76-power { };
  };
}
