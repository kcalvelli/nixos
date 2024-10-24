{ config, pkgs, ... }:
{
  # # PWA Desktop entries
  # # If you are not me, do not use this 
  xdg.desktopEntries = {

    "brave-aghbiahbpaijignceidepookljebhfak-Default" = {
      name = "Google Drive";
      exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=aghbiahbpaijignceidepookljebhfak";
      icon = "brave-aghbiahbpaijignceidepookljebhfak-Default";
      terminal = false;
      type = "Application";
      settings = {
        StartupWMClass = "crx_aghbiahbpaijignceidepookljebhfak";
      };
    };
    "brave-agimnkijcaahngcdmfeangaknmldooml-Default" = {
      name = "YouTube";
      exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml";
      icon = "brave-agimnkijcaahngcdmfeangaknmldooml-Default";
      terminal = false;
      type = "Application";
      settings = {
        StartupWMClass = "crx_agimnkijcaahngcdmfeangaknmldooml";
      };
      actions = {
        "Subscriptions" = {
          name = "Subscriptions";
          exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml --app-launch-url-for-shortcuts-menu-item=https://www.youtube.com/feed/subscriptions";
        };
        "Explore" = {
          name = "Explore";
          exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml --app-launch-url-for-shortcuts-menu-item=https://www.youtube.com/feed/explore";
        };
      };
    };
    "brave-ejhkdoiecgkmdpomoahkdihbcldkgjci-Default" = {
      name = "Element";
      exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=ejhkdoiecgkmdpomoahkdihbcldkgjci";
      icon = "brave-ejhkdoiecgkmdpomoahkdihbcldkgjci-Default";
      terminal = false;
      type = "Application";
      settings = {
        StartupWMClass = "crx_ejhkdoiecgkmdpomoahkdihbcldkgjci";
      };
    };
    "brave-hpfldicfbfomlpcikngkocigghgafkph-Default" = {
      name = "Messages";
      exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=hpfldicfbfomlpcikngkocigghgafkph";
      icon = "brave-hpfldicfbfomlpcikngkocigghgafkph-Default";
      terminal = false;
      type = "Application";
      settings = {
        StartupWMClass = "crx_hpfldicfbfomlpcikngkocigghgafkph";
      };
    };
    "brave-kjgfgldnnfoeklkmfkjfagphfepbbdan-Default" = {
      name = "Google Meet";
      exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=kjgfgldnnfoeklkmfkjfagphfepbbdan";
      icon = "brave-kjgfgldnnfoeklkmfkjfagphfepbbdan-Default";
      terminal = false;
      type = "Application";
      settings = {
        StartupWMClass = "crx_kjgfgldnnfoeklkmfkjfagphfepbbdan";
      };
    };
    "brave-mdpkiolbdkhdjpekfbkbmhigcaggjagi-Default" = {
      name = "Google Chat";
      exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=mdpkiolbdkhdjpekfbkbmhigcaggjagi";
      icon = "brave-mdpkiolbdkhdjpekfbkbmhigcaggjagi-Default";
      terminal = false;
      type = "Application";
      settings = {
        StartupWMClass = "crx_mdpkiolbdkhdjpekfbkbmhigcaggjagi";
      };
    };
    "brave-mnhkaebcjjhencmpkapnbdaogjamfbcj-Default" = {
      name = "Google Maps";
      exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=mnhkaebcjjhencmpkapnbdaogjamfbcj";
      icon = "brave-mnhkaebcjjhencmpkapnbdaogjamfbcj-Default";
      terminal = false;
      type = "Application";
      settings = {
        StartupWMClass = "crx_mnhkaebcjjhencmpkapnbdaogjamfbcj";
      };
    };
    "brave-ncmjhecbjeaamljdfahankockkkdmedg-Default" = {
      name = "Google Photos";
      exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=ncmjhecbjeaamljdfahankockkkdmedg";
      icon = "brave-ncmjhecbjeaamljdfahankockkkdmedg-Default";
      terminal = false;
      type = "Application";
      settings = {
        StartupWMClass = "crx_ncmjhecbjeaamljdfahankockkkdmedg";
      };
    };

    "brave-ibblmnobmgdmpoeblocemifbpglakpoi-Default" = {
      name = "Telegram Web";
      exec = "/run/current-system/sw/bin/brave --profile-directory=Default --app-id=ibblmnobmgdmpoeblocemifbpglakpoi";
      icon = "brave-ibblmnobmgdmpoeblocemifbpglakpoi-Default";
      terminal = false;
      type = "Application";
      settings = {
        StartupWMClass = "crx_ibblmnobmgdmpoeblocemifbpglakpoi";
      };
    };

    # "Visual Studio Code" = {
    # "Visual Studio Code" = {
    #   name = "Visual Studio Code";
    #   exec = "/run/current-system/sw/bin/code";
    #   icon = "vscode";
    #   terminal = false;
    #   type = "Application";
    #   actions = {
    #     "New-Window" = {
    #       name = "New Window";
    #       exec = "/run/current-system/sw/bin/code --new-window";
    #     };
    #   };
    # };
  };

  systemd.user.services.clear-pwa-desktop-entries = {
    Unit = {
      Description = "Clear PWA Desktop Entries";
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/rm -f $HOME/.local/share/applications/brave-*.desktop'";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  # home.file.".local/share/icons/vscode.png" = {
  #   enable = true;
  #   force = true;
  #   source = ./resources/vscode.png;
  # };
}
