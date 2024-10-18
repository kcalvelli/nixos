{ inputs, pkgs, ... }:

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

        # Locally installed binaries (non-nix) added to session PATH
        home.sessionPath = [
          "$HOME/zig/master/files"
          "$HOME/.cargo/bin"
          "$HOME/.npm-global/bin"
        ];

        home.sessionVariables = {
          NPM_CONFIG_PREFIX = "$HOME/.npm-global";
        };

        home.packages = with pkgs; [
          nodejs
          # Add other packages here
        ];

        home.file.".npmrc".text = ''
          prefix=$HOME/.npm-global
        '';
      };
  };

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

  nix.settings = {
    trusted-users = [ "keith" ];
  };
}
