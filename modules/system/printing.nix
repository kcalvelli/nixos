{ pkgs, ... }:
{
  # Enable and configure printing services
  services.printing = {
    enable = true;
    openFirewall = true;
    drivers = [
      #pkgs.hplip
      #pkgs.hplipWithPlugin
    ];
  };
}
