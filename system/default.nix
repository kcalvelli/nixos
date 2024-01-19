 { inputs, config, pkgs, ... }:

 {
  #Config common to all hosts
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

  #Use systemd-boot
  boot = {
    #kernelPackages = pkgs.linuxPackages_latest;
    # Trying xanmod
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    #  Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
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
    #NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
  };
 }
