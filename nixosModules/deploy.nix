{ inputs, pkgs, ... }:
{
  let
    cachix-deploy-lib = inputs.cachix-deploy.lib pkgs;
  in
    cachix-deploy-lib.spec {
      agents.${hostname} = self.nixosConfigurations.${hostname}.config.system.build.toplevel;
  };
}