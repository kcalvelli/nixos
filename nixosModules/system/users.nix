{ config, inputs, ... }:

{
  # Define users
  users.users = {
    keith = {
      isNormalUser = true;
      description = "Keith Calvelli";
      extraGroups = [ "networkmanager" "wheel" "kvm" "input" "disk""libvirtd" "plugdev" "libvirtd" ];
    };
    calvelli = {
      isNormalUser = true;
      description = "Keith Calvelli";
      extraGroups = [ "networkmanager" "wheel" "kvm" "input" "disk""libvirtd" "plugdev" "libvirtd" ];
    };        
  };

  home-manager.users = {
    keith = {
      imports = [ inputs.self.homeModules.desktop ];
      home.stateVersion = "24.05";
      home.homeDirectory = "/home/keith";
      home.username = "keith";      
    };
    calvelli = {
      imports = [ inputs.self.homeModules.desktop ];
      home.stateVersion = "24.05";
      home.homeDirectory = "/home/calvelli";
      home.username = "calvelli";      
    };     
  };
}