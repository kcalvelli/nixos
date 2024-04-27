{ config, lib, nixpkgs, pkgs, ... }:
{
  #Update Brave nightly - browsers should always be up to date
  systemd.timers."update_brave" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "update_brave.service";
    };
  };

  systemd.services."update_brave" = {
    script = ''
      /home/keith/.config/nixos/packages/brave-browser/update.sh
    '';
  };
  serviceConfig = {
    Type = "oneshot";
    User = "root";
  };
}