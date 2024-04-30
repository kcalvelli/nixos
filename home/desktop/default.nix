{ pkgs, ... }:

{
  systemd.user.targets.autostart-cosmic = {
    Unit.Wants = [ "xdg-desktop-autostart.target" ]; 
    Unit.After = [ "default.target" ];
  };

  home.packages = [
    #Here be packages
    (pkgs.writeShellScriptBin "autostart" ''
      systemctl start --user autostart-cosmic.target
      '')
  ];  

   #Native Messaging Host for Brave - Enable if running plasma
    #home.file.".config/BraveSoftware/Brave-Browser/NativeMessagingHosts/org.kde.plasma.browser_integration.json".source = "${pkgs.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json"; 
}