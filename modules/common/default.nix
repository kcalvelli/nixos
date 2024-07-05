{ ... }:
{
  imports = [
    ./fonts.nix
    ./filesystems.nix
    ./boot.nix
    ./users.nix
    ./environment.nix
    ./security.nix
  ];

  # Boot config
  boot = {
    bootspec.enable = true;

    initrd = {
      systemd.enable = true;
      verbose = false;
    };
    # Plymouth is purty
    plymouth.enable = true;
  };

  # Swap config
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };  

  # Filesystem config
  environment.systemPackages = with pkgs; [
    sshfs
    fuse
    ntfs3g
  ];

  services.udisks2.enable = true;

  # Privacy
  programs = {
    gnupg.agent = {
      enable = true;
    };
  };
    
  # Environment setup
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

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    #GTK_USE_PORTAL = 1;
  };
      
}
