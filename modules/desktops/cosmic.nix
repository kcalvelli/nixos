{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  #Just cosmic
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  #Keyring
  security.pam.services.login.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;  

  #Missing apps for DE experience
  programs.evince.enable = true;
  programs.file-roller.enable = true;

  services.gnome.sushi.enable = true;

  environment.systemPackages = (with pkgs; [
    adw-gtk3   
    baobab
    gparted
    gthumb
    gimp
    loupe
    resources
    kooha
    pavucontrol
    clapper

    #inputs.self.packages.${pkgs.system}.cosmic-clipboard-manager
  ])
   ++ ( with pkgs.gnome; [
    gnome-calculator
    nautilus
    simple-scan  
   ]);
   services.gvfs.enable = true;

   # Minimize how bad qt apps look here
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";
}
