{ pkgs, lib, config, ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        lock_cmd = lib.getExe inputs.hyprland.packages.${pkgs.system}.hypridle;
        before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "${lib.getExe inputs.hyprland.packages.${pkgs.system}.hypridle}";
        }
        {
          timeout = 900;
          on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}