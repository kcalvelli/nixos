{ inputs, lib, ... }:
{
  imports = [
    ./gnome.nix
    ./cosmic.nix
  ];

  # Until Cosmic is more stable, default to Gnome but keep a specialisation for cosmic
  #gnome.enable = true;
  #specialisation = {
  #  cosmic.configuration = {
  #    system.nixos.tags = [
  #      "Cosmic"
  #    ];
  #    gnome.enable = lib.mkForce false;
  #    cosmic.enable = true;
  #  };
  #};    

  # Cosmic as default, keep Gnome for backup
  cosmic.enable = true;
  specialisation = {
    gnome.configuration = {
      system.nixos.tags = [
        "Gnome"
      ];
      cosmic.enable = lib.mkForce false;
      gnome.enable = true;
    };
  };  
}