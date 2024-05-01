{ inputs, ... }:

{
  # Define users
  users.users = {
    keith = {
      isNormalUser = true;
      description = "Keith Calvelli";
      extraGroups = [ "networkmanager" "wheel" "kvm" "input" "disk""libvirtd" "plugdev" "libvirtd" ];
    };       
  };

  # Configure home-manager
  home-manager.extraSpecialArgs.inputs = inputs; # forward the inputs
  home-manager.useGlobalPkgs = true; # don't create another instance of nixpkgs
  home-manager.useUserPackages = true; # install user packages directly to the user's profile
  
  home-manager.users = {
    keith = {
      imports = with inputs.self.homeModules; [ 
        desktop
        virtualisation 
        cli
        development
      ];
      home.stateVersion = "24.05";
      home.homeDirectory = "/home/keith";
      home.username = "keith";      
    };     
  };     
}