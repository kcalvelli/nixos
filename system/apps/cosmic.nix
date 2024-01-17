{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    cosmic-bg
    cosmic-osd
    cosmic-term
    cosmic-edit
    cosmic-comp
    cosmic-randr
    cosmic-panel
    cosmic-icons
    cosmic-files
    cosmic-greeter
    cosmic-applets
    cosmic-settings
    cosmic-launcher
    cosmic-screenshot
    cosmic-applibrary
    cosmic-design-demo
    cosmic-notifications
    cosmic-settings-daemon
    cosmic-workspaces-epoch
  ];

  services.kdeconnect = 
  {
    enable = true;  
  };
  
  dconf.enable = true;
}