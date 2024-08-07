{ inputs, ... }:

{
  # Define users
  users.users = {
    keith = {
      isNormalUser = true;
      description = "Keith Calvelli";
      extraGroups = [
        "networkmanager"
        "wheel"
        "kvm"
        "input"
        "disk"
        "libvirtd"
        "plugdev"
        "qemu-libvirtd"
        "video"
      ];
    };
  };

  home-manager.users = {
    keith = {
      home.stateVersion = "24.05";
      home.homeDirectory = "/home/keith";
      home.username = "keith";
      programs.git = {
        userName = "Keith Calvelli";
        userEmail = "keith@calvelli.dev";
      };        
    };
  };

  services.samba = {
      shares.music = {
      path = "/home/keith/Music";
      writable = true;
    };

    shares.pictures = {
      path = "/home/keith/Pictures";
      writable = true;
    };
  };  

  nix.settings = {
    trusted-users = [
      "keith"
    ];
  };
}