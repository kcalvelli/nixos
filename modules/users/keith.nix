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
        "adm"
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
      # Locally installed binaries (non-nix) added to session PATH
      home.sessionPath = [
        # For zig
        "/home/keith/zig/master/files"
        # For cargo
        "/home/keith/.cargo/bin"
      ];      
    };
  };

  services = {
    samba = {
      settings = {
        music = {
          path = "/home/keith/Music";
          writable = true;
        };
        pictures = {
          path = "/home/keith/Pictures";
          writable = true;
        };
      };
    };
  };  

  nix.settings = {
    trusted-users = [
      "keith"
    ];
  };
}