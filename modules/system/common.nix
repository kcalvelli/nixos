 { lib, inputs, config, pkgs, ... }:

 {



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
    NIXOS_OZONE_WL = 1;
    #GTK_USE_PORTAL = 1;
  };



  
  # Configure home-manager
  home-manager.extraSpecialArgs.inputs = inputs; # forward the inputs
  home-manager.useGlobalPkgs = true; # don't create another instance of nixpkgs
  home-manager.useUserPackages = true; # install user packages directly to the user's profile

  #Flatpak
  #services.flatpak.enable = true;
 }
