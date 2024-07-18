{ config, lib, pkgs, inputs, ... }:
let 
  cfg = config.apps;
in  
{

  options = {
    apps.office = {
      enable = lib.mkEnableOption "Office Apps";
    };
    apps.utils = {
      enable = lib.mkEnableOption "Utility Apps";
    };
    apps.virtualisation = {
      enable = lib.mkEnableOption "Virtualisation Apps";
    };
    apps.filesystem = {
      enable = lib.mkEnableOption "Filesystem Apps";
    };
    apps.development = {
      enable = lib.mkEnableOption "Development Apps";
    };
    apps.games = {
      enable = lib.mkEnableOption "Games";
    };
    apps.graphics = {
      enable = lib.mkEnableOption "Graphics Apps";
    };
    apps.video = {
      enable = lib.mkEnableOption "Video Apps";
    };
    apps.network = {
      enable = lib.mkEnableOption "Network Apps";
    };
    apps.all = {
      enable = lib.mkEnableOption "All apps";
    };
  };
    
 
  config = lib.mkMerge [
    ### Office 
    (lib.mkIf cfg.office.enable {
      environment.systemPackages = with pkgs; [ 
        libreoffice-fresh
        teams-for-linux 
      ];
    })

    ### Utilities  
    (lib.mkIf cfg.utils.enable {

      # Privacy
      programs = {
        gnupg.agent = {
          enable = true;
        };
      };
      
      environment.systemPackages = with pkgs; [ 
        cubicsdr
        mission-center
        wlogout
        gnome-firmware
        ptyxis
        # Rust replacement for gnu coreutils
        uutils-coreutils-noprefix
    
        # Very Rusty
        bandwhich
        bat
        bottom
        broot
        dua
        dust
        eza
        fd
        helix
        ouch
        procs
        rm-improved
        ripgrep
        skim
        tokei
        xcp
        zoxide
    
        # Get stuff
        wget
        curl
    
        # Info stuff
        pciutils
        wirelesstools
        gtop
        iw        
      ];
    })

    ### Virtualisation
    (lib.mkIf cfg.virtualisation.enable {
      environment.systemPackages = with pkgs; [ 
        qemu_full
        inputs.self.packages.${pkgs.system}.quickemu
        virt-viewer
        spice-gtk
        distrobox
        boxbuddy
      ];
    })

    ### Filesystem
    (lib.mkIf cfg.filesystem.enable {
      environment.systemPackages = with pkgs; [ 
        sshfs
        fuse
        ntfs3g
      ];
    })

    ### Development
    (lib.mkIf cfg.development.enable {
      environment.systemPackages = with pkgs; [ 
        nil
        zed-editor
        nixfmt-rfc-style
        (vscode.override {
          commandLineArgs = [
            "--ozone-platform-hint=auto"
            "--ozone-platform=wayland"
            "--gtk-version=4"
            "--password-store=gnome"
          ];
        })
      ];
    })

    ### Games
    (lib.mkIf cfg.games.enable {
      environment.systemPackages = with pkgs; [ 
        superTuxKart
      ];
    })

    ### Graphics
    (lib.mkIf cfg.games.enable {
      environment.systemPackages = with pkgs; [ 
        radeontop
        umr
        gimp
        amdgpu_top
        clinfo
      ];
    })
    
    ### Video
    (lib.mkIf cfg.games.enable {
      environment.systemPackages = with pkgs; [ 
        clapper
        gnomecast 
      ];
    })  
     
    ### Network
    (lib.mkIf cfg.games.enable {
      environment.systemPackages = with pkgs; [ 
        #inputs.self.packages.${pkgs.system}.brave-browser
        brave
        telegram-desktop 
        openssl 
        nextcloud-client
        inputs.self.packages.${pkgs.system}.valent   
      ];
    })

    ### All apps
    (lib.mkIf cfg.all.enable {
      apps.office.enable = true;
      apps.utils.enable = true;
      apps.virtualisation.enable = true;
      apps.filesystem.enable = true;
      apps.development.enable = true;
      apps.games.enable = true;
      apps.graphics.enable = true;
      apps.video.enable = true;  
      apps.network.enable = true; 
    })    
  ]; 
}
