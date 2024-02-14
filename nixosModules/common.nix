 { inputs, config, pkgs, ... }:

 {
  #Config common to all hosts

  imports = [
    ./keith.nix
    inputs.home-manager.nixosModules.default
  ];

  #Nix config
  nix = {
    package = pkgs.nixFlakes;
    settings.experimental-features = [ "nix-command" "flakes" ];
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  #services.cachix-agent.enable = true;

  # Allow unfree
  nixpkgs = {
    config = {
      allowUnfree = true;
    };    
  };

  system.stateVersion = "23.11"; # Did you read the comment?

  # Configure all the machines with binary cache
  nix.settings.trusted-public-keys = [
    "calvelli-nix-cache.cachix.org-1:wmpkUk58/e+QQybGe2EQvkb0S2H8Xs4gu3I3zmGcf0U="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="    
  ];
  nix.settings.substituters = [
    "https://calvelli-nix-cache.cachix.org"
    "https://nix-community.cachix.org"
  ];

  #Use systemd-boot
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    bootspec.enable = true;
    # Trying xanmod
    #kernelPackages = pkgs.linuxPackages_xanmod_latest;
    #  Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      #timeout = 1;
      #grub.enable = false;
    };
    initrd = {
      # Setup keyfile
#      secrets = {
#        "/crypto_keyfile.bin" = null;
#      };
      systemd.enable = true;
      kernelModules = [ "amdgpu"];    
    };
    # Plymouth is purty
    plymouth.enable = true;
  };

  #Who uses Swap?
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  # Enable firmware updates
  services.fwupd.enable = true;

  # Enable native Wayland support for chromium based browsers and Electron
  # Temp disable Wayland for Electron due to bug
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
  };

  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
    opengl = {
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        vaapiVdpau
      ];
      driSupport = true;
      driSupport32Bit = true;
    };
    rtl-sdr.enable = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];  

  networking = { 
    networkmanager.enable = true;
    networkmanager.dns = "none";
    nameservers = [ "100.100.100.100" "45.90.28.215" "45.90.28.215" ];
    search = [ "taile0fb4.ts.net" ]; 
    # Firewall Config
    #networking.firewall.allowedUDPPorts = [ ... ];
    #networking.firewall.allowedTCPPorts = [ ... ];
    firewall.enable = false;

    # Use iwd instead of wpa_supplicant
    #wireless.iwd.enable = true;
    #networkmanager.wifi.backend = "iwd";
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        domain = true;
        hinfo = true;
        userServices = true;
        workstation = true;
      };
    extraServiceFiles = {
      smb = ''
        <?xml version="1.0" standalone='no'?><!--*-nxml-*-->
        <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
        <service-group>
          <name replace-wildcards="yes">%h</name>
          <service>
            <type>_smb._tcp</type>
            <port>445</port>
          </service>
        </service-group>
      '';
      };
    };
    openssh.enable = true;

    tailscale = {
      enable = true;
      useRoutingFeatures = "both";     
    };
  };

  programs.mtr.enable = true;

  #Samba
  services.samba = {
    enable = true;

    enableNmbd = false;

    # You will still need to set up the user accounts to begin with:
    # $ sudo smbpasswd -a yourusername

    # This adds to the [global] section:
    extraConfig = ''
      browseable = yes
      smb encrypt = required
      wins support = no
      domain master = no
      local master = no
    '';

    shares = {
      homes = {
        browseable = "no";  # note: each home will be browseable; the "homes" share will not.
        "read only" = "no";
        "guest ok" = "no";
      };
    };
  };
  
  # Curiously, `services.samba` does not automatically open
  # the needed ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 445 139 ];
  networking.firewall.allowedUDPPorts = [ 137 138 ];

  # Configure home-manager
  home-manager.extraSpecialArgs.inputs = inputs; # forward the inputs
  home-manager.useGlobalPkgs = true; # don't create another instance of nixpkgs
  home-manager.useUserPackages = true; # install user packages directly to the user's profile
  
  environment.systemPackages = with pkgs; [
    sshfs
  ];  
 }