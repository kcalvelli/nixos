{ inputs, pkgs, ... }:

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

  environment.systemPackages = with pkgs; [
    adw-gtk3   
    cosmic-tasks
    cosmic-emoji-picker
    #inputs.self.packages.${pkgs.system}.cosmic-clipboard-manager
  ];

   services.gvfs.enable = true;

   # Enable flatpak
   services.flatpak.enable = true;
   
   # Minimize how bad qt apps look here
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";
}
