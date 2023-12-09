 { pkgs, ... }:

 {
  environment.systemPackages = with pkgs; [
    cosmic-osd
    cosmic-edit
    cosmic-comp
    cosmic-panel
    cosmic-icons
    cosmic-greeter
    cosmic-applets
    cosmic-settings
    cosmic-workspaces-epoch
  ]; 
 }