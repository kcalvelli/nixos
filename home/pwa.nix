{ config, pkgs, ... }:
{
  # # PWA Desktop entries
  # # If you are not me, do not use this 
   xdg.desktopEntries = {
  #   "Google Drive" = {
  #     name = "Google Drive";
  #     exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=aghbiahbpaijignceidepookljebhfak";
  #     icon = "brave-aghbiahbpaijignceidepookljebhfak-Default";
  #     terminal = false;
  #     type = "Application";
  #   };
  #   "YouTube" = {
  #     name = "YouTube";
  #     exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml";
  #     icon = "brave-agimnkijcaahngcdmfeangaknmldooml-Default";
  #     terminal = false;
  #     type = "Application";
  #     actions = {
  #       "Subscriptions" = {
  #         name = "Subscriptions";
  #         exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml --app-launch-url-for-shortcuts-menu-item=https://www.youtube.com/feed/subscriptions";
  #       };
  #       "Explore" = {
  #         name = "Explore";
  #         exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml --app-launch-url-for-shortcuts-menu-item=https://www.youtube.com/feed/explore";
  #       };
  #     };
  #   };
  #   "Element" = {
  #     name = "Element";
  #     exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=ejhkdoiecgkmdpomoahkdihbcldkgjci";
  #     icon = "brave-ejhkdoiecgkmdpomoahkdihbcldkgjci-Default";
  #     terminal = false;
  #     type = "Application";
  #   };
  #   "Messages" = {
  #     name = "Messages";
  #     exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=hpfldicfbfomlpcikngkocigghgafkph";
  #     icon = "brave-hpfldicfbfomlpcikngkocigghgafkph-Default";
  #     terminal = false;
  #     type = "Application";
  #   };
  #   "Google Meet" = {
  #     name = "Google Meet";
  #     exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=kjgfgldnnfoeklkmfkjfagphfepbbdan";
  #     icon = "brave-kjgfgldnnfoeklkmfkjfagphfepbbdan-Default";
  #     terminal = false;
  #     type = "Application";
  #   };
  #   "Google Chat" = {
  #     name = "Google Chat";
  #     exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=mdpkiolbdkhdjpekfbkbmhigcaggjagi";
  #     icon = "brave-mdpkiolbdkhdjpekfbkbmhigcaggjagi-Default";
  #     terminal = false;
  #     type = "Application";
  #   };
  #   "Google Maps" = {
  #     name = "Google Maps";
  #     exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=mnhkaebcjjhencmpkapnbdaogjamfbcj";
  #     icon = "brave-mnhkaebcjjhencmpkapnbdaogjamfbcj-Default";
  #     terminal = false;
  #     type = "Application";
  #   };
  #   "Google Photos" = {
  #     name = "Google Photos";
  #     exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=ncmjhecbjeaamljdfahankockkkdmedg";
  #     icon = "brave-ncmjhecbjeaamljdfahankockkkdmedg-Default";
  #     terminal = false;
  #     type = "Application";
  #   };
  #   "Microsoft Teams" = {
  #     name = "Microsoft Teams";
  #     exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=oiocllghmdadfpahmllbbhkgjfmaidmm";
  #     icon = "brave-oiocllghmdadfpahmllbbhkgjfmaidmm-Default";
  #     terminal = false;
  #     type = "Application";
  #   };
  #   "Outlook (PWA)" = {
  #     name = "Outlook (PWA)";
  #     exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=pkooggnaalmfkidjmlhoelhdllpphaga";
  #     icon = "brave-pkooggnaalmfkidjmlhoelhdllpphaga-Default";
  #     terminal = false;
  #     type = "Application";
  #     actions = {
  #       "New-Message" = {
  #         name = "New Message";
  #         exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=pkooggnaalmfkidjmlhoelhdllpphaga --app-launch-url-for-shortcuts-menu-item=https://outlook.office.com/mail/deeplink/compose";
  #       };
  #       "Open-Calendar" = {
  #         name = "Open Calendar";
  #         exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=pkooggnaalmfkidjmlhoelhdllpphaga --app-launch-url-for-shortcuts-menu-item=https://outlook.office.com/calendar/";
  #       };
  #       "New-Event" = {
  #         name = "New Event";
  #         exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=pkooggnaalmfkidjmlhoelhdllpphaga --app-launch-url-for-shortcuts-menu-item=https://outlook.office365.com/calendar/deeplink/compose";
  #       };
  #     };
  #   };
    "Visual Studio Code" = {
      name = "Visual Studio Code";
      exec = "/run/current-system/sw/bin/code";
      icon = "vscode";
      terminal = false;
      type = "Application";
      actions = {
        "New-Window" = {
          name = "New Window";
          exec = "/run/current-system/sw/bin/code --new-window";
        };
      };
    };
  };

  home.file.".local/share/icons/vscode.png" = {
    enable = true;
    force = true;
    source = ./resources/vscode.png;
  };
}