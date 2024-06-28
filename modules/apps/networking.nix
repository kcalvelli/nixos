{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #inputs.self.packages.${pkgs.system}.brave-browser
    brave
    inputs.self.packages.${pkgs.system}.quick-webapps
    nextcloud-client
    #valent 
    gnome.gnome-calendar
  ];

  # Email
  programs.geary.enable = true;  
  services.gnome.evolution-data-server.enable = true;  

  # Online accounts
  services.gnome.gnome-online-accounts.enable = true;
  services.accounts-daemon.enable = true;

}
