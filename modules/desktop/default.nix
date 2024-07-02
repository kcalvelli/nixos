{ inputs, lib, ... }:
{
  imports = [
    ./gnome.nix
    ./cosmic.nix
  ];

  # Until Cosmic is more stable, default to Gnome but keep a specialisation for cosmic
  gnome.enable = true;
  specialisation = {
    cosmic.configuration = {
      system.nixos.tags = [
        "Cosmic"
      ];
      gnome.enable = lib.mkForce false;
      cosmic.enable = true;
    };
  };    
}