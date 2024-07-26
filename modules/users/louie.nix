{ inputs, ... }:

{
  # Define users
  users.users = {
    louie = {
      isNormalUser = true;
      description = "Louie Finster";
      extraGroups = [
        "networkmanager"
        "wheel"
        "kvm"
        "input"
        "disk"
        "libvirtd"
        "plugdev"
        "qemu-libvirtd"
      ];
    };
  };

  home-manager.users = {
    louie = {
      home.stateVersion = "24.05";
      home.homeDirectory = "/home/louie";
      home.username = "louie";
      programs.git = {
        userName = "Louie Finster";
        userEmail = "louie@calvelli.dev";
      };        
    };
  };

  services.samba = {
      shares.music = {
      path = "/home/louie/Music";
      writable = true;
    };

    shares.pictures = {
      path = "/home/louie/Pictures";
      writable = true;
    };
  };  

  nix.settings = {
    trusted-users = [
      "louie"
    ];
  };
}