{ self, inputs, ...}:
let nixosSystem = args:
  inputs.nixpkgs.lib.nixosSystem ({ specialArgs = { inherit inputs; }; } // args);
in
{
  flake.nixosConfigurations = {
    office = nixosSystem {
      system = "x86_64-linux";
      modules = [  
        inputs.self.modules.cache
        ./office
      ];
    };
    pangolin = nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        inputs.self.modules.cache
        ./pangolin 
      ];
    };
  };

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