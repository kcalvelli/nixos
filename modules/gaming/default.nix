{ pkgs, inputs, ... }:
{

  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  hardware = {
    steam-hardware.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    platformOptimizations.enable = true;
  };

  # Enable gamemode
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 10;
      };
      custom = {
        start = "notify-send -a 'Gamemode' 'Optimizations activated'";
        end = "notify-send -a 'Gamemode' 'Optimizations deactivated'";
      };
    };
  };  
  
  #Enable Gamescope
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  # RGB Configuration
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
    package = pkgs.openrgb-with-all-plugins;
  };

  environment.systemPackages = with pkgs; [
    superTuxKart
  ];
}
