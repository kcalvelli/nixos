{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  #Just cosmic
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  #Missing apps for DE experience
  programs.evince.enable = true;
  programs.file-roller.enable = true;


  environment.systemPackages = with pkgs; [
    adw-gtk3   
    cosmic-tasks
    cosmic-emoji-picker
    #inputs.self.packages.${pkgs.system}.cosmic-clipboard-manager
  ];

  services = {
    gvfs.enable = true;
    gnome.core-utilities.enable = true;
    acpid.enable = true;
    gnome.sushi.enable = true;
    gnome.gnome-keyring.enable = true; 
    gnome.tracker.enable = true;
    gnome.tracker-miners.enable = true;
    gnome.core-shell.enable = true;
  };

  security.pam.services.login.enableGnomeKeyring = true;
   
   # Minimize how bad qt apps look here
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";
}
