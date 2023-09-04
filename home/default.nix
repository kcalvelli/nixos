 {inputs, outputs, ... }:
 {  
    imports = [
        inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
        extraSpecialArgs = { inherit inputs outputs; };
        users = {
            keith = import ./home.nix;
        };
    };
}