{ pkgs, inputs, ... }:
{
  # For KDEConnect protocol
  services.kdeconnect = {
    enable = true;
    package = inputs.self.packages.${pkgs.system}.valent;
  };

  home.packages = with pkgs; [
    # Browser, email, etc ...
    #inputs.self.packages.${pkgs.system}.brave-browser-nightly
    brave
    telegram-desktop 
    openssl 
    nextcloud-client
    inputs.self.packages.${pkgs.system}.valent     
    geary 
  ];
}