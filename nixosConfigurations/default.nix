{ self, inputs, ...}:
let nixosSystem = args:
  inputs.nixpkgs.lib.nixosSystem ({ specialArgs = { inherit inputs; }; } // args);
  #cachix-deploy-lib = inputs.cachix-deploy-flake.lib;
in
{
  flake.nixosConfigurations = {
    office = nixosSystem {
      system = "x86_64-linux";
      modules = [ ./office inputs.kde2nix.nixosModules.default ];
    };
    pangolin = nixosSystem {
      system = "x86_64-linux";
      modules = [ ./pangolin inputs.kde2nix.nixosModules.default ];
    };
  };
  
  #flake.cachix-deploy-spec = cachix-deploy-lib.spec {
  #  agents = {
  #    "pangolin"= self.nixosConfigurations."pangolin".config.system.build.toplevel;
  #    "office"= self.nixosConfigurations."office".config.system.build.toplevel;
  #  };
  #};

  perSystem = { pkgs, lib, system, ...}:
    let
      sysConfigs = lib.filterAttrs (_name: value: value.pkgs.system == system) self.nixosConfigurations;
    in
    {
      packages.nixos = pkgs.writeShellScriptBin "nixos" ''
        set -euo pipefail
        export SUDO_USER=1
        ${pkgs.nixos-rebuild}/bin/nixos-rebuild --flake ${self} "$@"
      '';

       checks = lib.mapAttrs' (name: value: { name = "nixos-toplevel-${name}"; value = value.config.system.build.toplevel; }) sysConfigs;
    };

}