{ config, pkgs, ... }:
{
  # PWA Desktop entries
  # If you are not me, do not use this 
  home.file.".local/share/applications/brave-aghbiahbpaijignceidepookljebhfak-Default.desktop" = {
    enable = true;
    force = true;
    text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=Google Drive
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=aghbiahbpaijignceidepookljebhfak
    Icon=brave-aghbiahbpaijignceidepookljebhfak-Default
    StartupWMClass=crx_aghbiahbpaijignceidepookljebhfak
    '';
  };

  home.file.".local/share/applications/brave-agimnkijcaahngcdmfeangaknmldooml-Default.desktop" = {
    enable = true;
    force = true;
    text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=YouTube
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml
    Icon=brave-agimnkijcaahngcdmfeangaknmldooml-Default
    StartupWMClass=crx_agimnkijcaahngcdmfeangaknmldooml
    Actions=Explore;Subscriptions
    
    [Desktop Action Explore]
    Name=Explore
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml "--app-launch-url-for-shortcuts-menu-item=https://www.youtube.com/feed/explore?feature=app_shortcuts"
    
    [Desktop Action Subscriptions]
    Name=Subscriptions
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml "--app-launch-url-for-shortcuts-menu-item=https://www.youtube.com/feed/subscriptions?feature=app_shortcuts"    
    '';   
  };

  home.file.".local/share/applications/brave-ejhkdoiecgkmdpomoahkdihbcldkgjci-Default.desktop" = {
    enable = true;
    force = true;
    text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=Element
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=ejhkdoiecgkmdpomoahkdihbcldkgjci
    Icon=brave-ejhkdoiecgkmdpomoahkdihbcldkgjci-Default
    StartupWMClass=crx_ejhkdoiecgkmdpomoahkdihbcldkgjci    
    '';  
  };  

  home.file.".local/share/applications/brave-hpfldicfbfomlpcikngkocigghgafkph-Default.desktop" = {
    enable = true;
    force = true;
    text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=Messages
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=hpfldicfbfomlpcikngkocigghgafkph
    Icon=brave-hpfldicfbfomlpcikngkocigghgafkph-Default
    StartupWMClass=crx_hpfldicfbfomlpcikngkocigghgafkph
    '';  
  }; 

  home.file.".local/share/applications/brave-kjgfgldnnfoeklkmfkjfagphfepbbdan-Default.desktop" = {
    enable = true;
    force = true;
    text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=Google Meet
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=kjgfgldnnfoeklkmfkjfagphfepbbdan
    Icon=brave-kjgfgldnnfoeklkmfkjfagphfepbbdan-Default
    StartupWMClass=crx_kjgfgldnnfoeklkmfkjfagphfepbbdan
    '';  
  };    

  home.file.".local/share/applications/brave-mdpkiolbdkhdjpekfbkbmhigcaggjagi-Default.desktop" = {
    enable = true;
    force = true;
    text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=Google Chat
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=mdpkiolbdkhdjpekfbkbmhigcaggjagi
    Icon=brave-mdpkiolbdkhdjpekfbkbmhigcaggjagi-Default
    StartupWMClass=crx_mdpkiolbdkhdjpekfbkbmhigcaggjagi
    '';  
  };   

  home.file.".local/share/applications/brave-mnhkaebcjjhencmpkapnbdaogjamfbcj-Default.desktop" = {
    enable = true;
    force = true;
    text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=Google Maps
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=mnhkaebcjjhencmpkapnbdaogjamfbcj
    Icon=brave-mnhkaebcjjhencmpkapnbdaogjamfbcj-Default
    StartupWMClass=crx_mnhkaebcjjhencmpkapnbdaogjamfbcj
    '';  
  };    

  home.file.".local/share/applications/brave-ncmjhecbjeaamljdfahankockkkdmedg-Default.desktop" = {
    enable = true;
    force = true;
    text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=Google Photos
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=ncmjhecbjeaamljdfahankockkkdmedg
    Icon=brave-ncmjhecbjeaamljdfahankockkkdmedg-Default
    StartupWMClass=crx_ncmjhecbjeaamljdfahankockkkdmedg
    '';  
  };     

  home.file.".local/share/applications/code.desktop" = {
    enable = true;
    force = true;
    text = 
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Actions=new-empty-window
    Categories=Utility;TextEditor;Development;IDE
    Comment=Code Editing. Redefined.
    Exec=/run/current-system/sw/bin/code %F
    GenericName=Text Editor
    Icon=vscode
    Keywords=vscode
    MimeType=text/plain;inode/directory
    Name=Visual Studio Code
    StartupNotify=true
    StartupWMClass=Code
    Type=Application
    Version=1.4
    
    [Desktop Action new-empty-window]
    Exec=/run/current-system/sw/bin/code --new-window %F
    Icon=vscode
    Name=New Empty Window
    '';
  };

  home.file.".local/share/applications/brave-oiocllghmdadfpahmllbbhkgjfmaidmm-Default.desktop" = {
  enable = true;
  force = true;
  text = 
  ''
  #!/usr/bin/env xdg-open
  [Desktop Entry]
  Version=1.1
  Terminal=false
  Type=Application
  Name=Microsoft Teams
  Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=oiocllghmdadfpahmllbbhkgjfmaidmm
  Icon=brave-oiocllghmdadfpahmllbbhkgjfmaidmm-Default
  StartupWMClass=crx_oiocllghmdadfpahmllbbhkgjfmaidmm
  '';
  };

  home.file.".local/share/applications/brave-faolnafnngnfdaknnbpnkhgohbobgegn-Default.desktop" = {
    enable = true;
    force = true; 
    text =
    ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=Outlook (PWA)
    MimeType=x-scheme-handler/mailto
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn %U
    Icon=brave-faolnafnngnfdaknnbpnkhgohbobgegn-Default
    StartupWMClass=crx_faolnafnngnfdaknnbpnkhgohbobgegn
    Actions=New-event;New-message;Open-calendar
    
    [Desktop Action New-event]
    Name=New event
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn --app-launch-url-for-shortcuts-menu-item=https://outlook.office.com/calendar/deeplink/compose
    
    [Desktop Action New-message]
    Name=New message
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn --app-launch-url-for-shortcuts-menu-item=https://outlook.office.com/mail/deeplink/compose
    
    [Desktop Action Open-calendar]
    Name=Open calendar
    Exec=/run/current-system/sw/bin/brave --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn --app-launch-url-for-shortcuts-menu-item=https://outlook.office.com/calendar   
    '';  
  }; 

  home.file.".local/share/icons/vscode.png" = {
    enable = true;
    force = true;
    source = ./resources/vscode.png;
  };  
}