{ inputs, pkgs, ... }:
{
  imports = [
    ./avahi.nix
    #./bridge.nix
    ./network.nix
    ./samba.nix
    #./zerotier.nix  
    #./hosting.nix
  ];

  environment.systemPackages = with pkgs; [
    #inputs.self.packages.${pkgs.system}.brave-browser
    (brave.override {
      commandLineArgs = [
        "--gtk-version=4"           
      ];
     })
    nextcloud-client
    valent
  ];

  # Uncomment if removing GNOME
  # Email
  #programs.geary.enable = true;
  #services.gnome.evolution-data-server.enable = true;

  # Online accounts
  #services.gnome.gnome-online-accounts.enable = true;
  #services.accounts-daemon.enable = true;
}
