{ config, pkgs, ... }:
{
  # PWA Desktop entries
  # If you are not me, do not use this 
  home.file = {
    ".local/share/applications/brave-aghbiahbpaijignceidepookljebhfak-Default.desktop".text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=Google Drive
    Exec=brave --profile-directory=Default --app-id=aghbiahbpaijignceidepookljebhfak
    Icon=brave-aghbiahbpaijignceidepookljebhfak-Default
    StartupWMClass=crx_aghbiahbpaijignceidepookljebhfak
    '';
  };

  home.file = {
   ".local/share/applications/brave-agimnkijcaahngcdmfeangaknmldooml-Default.desktop".text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=YouTube
    Exec=brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml
    Icon=brave-agimnkijcaahngcdmfeangaknmldooml-Default
    StartupWMClass=crx_agimnkijcaahngcdmfeangaknmldooml
    Actions=Explore;Subscriptions
    
    [Desktop Action Explore]
    Name=Explore
    Exec=brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml "--app-launch-url-for-shortcuts-menu-item=https://www.youtube.com/feed/explore?feature=app_shortcuts"
    
    [Desktop Action Subscriptions]
    Name=Subscriptions
    Exec=/brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml "--app-launch-url-for-shortcuts-menu-item=https://www.youtube.com/feed/subscriptions?feature=app_shortcuts"    
    '';
  };

  home.file = {
   ".local/share/applications/brave-ejhkdoiecgkmdpomoahkdihbcldkgjci-Default".text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=Element
    Exec=/brave --profile-directory=Default --app-id=ejhkdoiecgkmdpomoahkdihbcldkgjci
    Icon=brave-ejhkdoiecgkmdpomoahkdihbcldkgjci-Default
    StartupWMClass=crx_ejhkdoiecgkmdpomoahkdihbcldkgjci    
    '';  
  };  
}