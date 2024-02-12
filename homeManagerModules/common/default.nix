{ config, pkgs, inputs, ... }:
{
    # Enable home manager
    programs.home-manager.enable = true;
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };

    home.homeDirectory = "/home/keith";
    home.stateVersion = "24.05";
    home.username = "keith";

    # Test
    home.packages = with pkgs; [
      cowsay
    ];

    home.file.".config/BraveSoftware/Brave-Browser/NativeMessagingHosts/org.kde.plasma.browser_integration.json".source = "${pkgs.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json";
    home.file.".config/BraveSoftware/Brave-Browser-Nightly/NativeMessagingHosts/org.kde.plasma.browser_integration.json".source = "${pkgs.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json";
}