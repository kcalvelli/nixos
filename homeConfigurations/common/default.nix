{ config, pkgs, inputs, ... }:
{
    home.homeDirectory = "/home/keith";
    home.stateVersion = "24.05";
    home.username = "keith";
    
    home.file.".config/BraveSoftware/Brave-Browser/NativeMessagingHosts/org.kde.plasma.browser_integration.json".source = "${pkgs.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json";
    home.file.".config/BraveSoftware/Brave-Browser-Nightly/NativeMessagingHosts/org.kde.plasma.browser_integration.json".source = "${pkgs.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json";
}