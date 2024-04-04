{ config, lib, pkgs, ... }:

{
  systemd.user.targets.autostart-cosmic = {
    Unit.Wants = [ "xdg-desktop-autostart.target" ]; 
    Unit.After = [ "default.target" ];
  };

  #systemd.user.services.autostart-cosmic = {
  #  Unit = {
  #    Description = "Launch xdg-desktop-autostart on Cosmic.";
  #  };
  #  Install = {
  #    WantedBy = [ "default.target" ];
  #  };
  #  Service = {
  #    ExecStart = "${pkgs.writeShellScript "autostart-cosmic" ''
  #    systemctl start --user autostart-cosmic.target
  #    ''}";
  #  };
  #};

  #{
  #  Unit = {
  #    Description = "Run XDG autostart files in cosmic";
  #    BindsTo = ["graphical-session.target"];
  #    Wants = [ "graphical-session-pre.target" "xdg-desktop-autostart.target" ];
  #    After = ["graphical-session-pre.target"];
  #    Before = [ "xdg-desktop-autostart.target" ];
  #  };
  #};   

  home.packages = [
    #Here be packages
    (pkgs.writeShellScriptBin "autostart" ''
      systemctl start --user autostart-cosmic.target
      '')
  ];  

   #Native Messaging Host for Brave - Enable if running plasma
    #home.file.".config/BraveSoftware/Brave-Browser/NativeMessagingHosts/org.kde.plasma.browser_integration.json".source = "${pkgs.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json"; 
}