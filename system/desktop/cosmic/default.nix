 { pkgs, ... }:

 {
  environment.systemPackages = with pkgs; [
    cosmic-edit
    cosmic-comp
    cosmic-panel
    cosmic-icons
    cosmic-greeter
    cosmic-applets
    cosmic-settings
  ]; 
 }