 { inputs, config, pkgs, ... }:

 {
  #Config common to all hosts

  imports = [
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

  # Allow unfree
  nixpkgs = {
    config = {
      allowUnfree = true;
    };    
  };

  system.stateVersion = "23.11"; # Did you read the comment?

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
      verbose = false;  
    };
    # Plymouth is purty
    plymouth.enable = true;
  };

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

  
  # Configure home-manager
  home-manager.extraSpecialArgs.inputs = inputs; # forward the inputs
  home-manager.useGlobalPkgs = true; # don't create another instance of nixpkgs
  home-manager.useUserPackages = true; # install user packages directly to the user's profile

  #Flatpak
  services.flatpak.enable = true;
 }