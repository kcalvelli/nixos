{ inputs, pkgs, ... }:

{
  # Define the user for the system
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

  # Home Manager configuration for the user
  home-manager.users = {
    keith =
      { pkgs, ... }:
      {
        home.stateVersion = "24.05";
        home.homeDirectory = "/home/keith";
        home.username = "keith";

        programs.git = {
          enable = true;
          userName = "Keith Calvelli";
          userEmail = "keith@calvelli.dev";
        };
      };
  };

  # User specific samba configuration
  services.samba = {
    enable = true;
    settings = {
      "music" = {
        "path" = "/home/keith/Music";
        "writable" = "yes";
        "guest ok" = "no";
      };
      "pictures" = {
        "path" = "/home/keith/Pictures";
        "writable" = "yes";
        "guest ok" = "no";
      };
    };
  };

  # Learn to trust yourself
  nix.settings = {
    trusted-users = [ "keith" ];
  };
}
