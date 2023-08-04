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

  #Use latest kernel and systemd-boot
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
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

  # Packages installed on every system
  environment.systemPackages = with pkgs; [
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    gnugrep
    xdg-user-dirs 
    libnotify
    clinfo
    hplipWithPlugin
    pinentry
    home-manager
    pciutils 
    cachix
    xorg.xhost
  ];

  # Back and forth on flatpak
  #services.flatpak.enable = true;
  
  # Enable firmware updates
  services.fwupd.enable = true;

  # Enable native Wayland support for chromium based browsers and Electron
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
  };

 }
