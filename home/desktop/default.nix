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
    Exec=brave --profile-directory=Default --app-id=aghbiahbpaijignceidepookljebhfak
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
    Exec=brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml
    Icon=brave-agimnkijcaahngcdmfeangaknmldooml-Default
    StartupWMClass=crx_agimnkijcaahngcdmfeangaknmldooml
    Actions=Explore;Subscriptions
    
    [Desktop Action Explore]
    Name=Explore
    Exec=brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml "--app-launch-url-for-shortcuts-menu-item=https://www.youtube.com/feed/explore?feature=app_shortcuts"
    
    [Desktop Action Subscriptions]
    Name=Subscriptions
    Exec=brave --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml "--app-launch-url-for-shortcuts-menu-item=https://www.youtube.com/feed/subscriptions?feature=app_shortcuts"    
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
    Exec=brave --profile-directory=Default --app-id=ejhkdoiecgkmdpomoahkdihbcldkgjci
    Icon=brave-ejhkdoiecgkmdpomoahkdihbcldkgjci-Default
    StartupWMClass=crx_ejhkdoiecgkmdpomoahkdihbcldkgjci    
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
    Exec=brave --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn %U
    Icon=brave-faolnafnngnfdaknnbpnkhgohbobgegn-Default
    StartupWMClass=crx_faolnafnngnfdaknnbpnkhgohbobgegn
    Actions=New-event;New-message;Open-calendar
    
    [Desktop Action New-event]
    Name=New event
    Exec=brave --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn --app-launch-url-for-shortcuts-menu-item=https://outlook.office.com/calendar/deeplink/compose
    
    [Desktop Action New-message]
    Name=New message
    Exec=brave --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn --app-launch-url-for-shortcuts-menu-item=https://outlook.office.com/mail/deeplink/compose
    
    [Desktop Action Open-calendar]
    Name=Open calendar
    Exec=brave --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn --app-launch-url-for-shortcuts-menu-item=https://outlook.office.com/calendar   
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
    Exec=brave --profile-directory=Default --app-id=hpfldicfbfomlpcikngkocigghgafkph
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
    Exec=brave --profile-directory=Default --app-id=kjgfgldnnfoeklkmfkjfagphfepbbdan
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
    Exec=brave --profile-directory=Default --app-id=mdpkiolbdkhdjpekfbkbmhigcaggjagi
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
    Exec=brave --profile-directory=Default --app-id=mnhkaebcjjhencmpkapnbdaogjamfbcj
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
    Exec=brave --profile-directory=Default --app-id=ncmjhecbjeaamljdfahankockkkdmedg
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
    Exec=code %F
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
    Exec=code --new-window %F
    Icon=vscode
    Name=New Empty Window
    '';
  };

  home.file.".local/share/icons/vscode.png" = {
    enable = true;
    force = true;
    source = ../resources/vscode.png;
  };  

  home.file.".config/solaar/config.yaml" = {
    enable = true;
    force = true;
    text = 
    ''
    - 1.1.13
    - _NAME: MX Master 3S
      _absent: [hi-res-scroll, lowres-scroll-mode, onboard_profiles, report_rate, report_rate_extended, pointer_speed, dpi_extended, speed-change, backlight,
        backlight_level, backlight_duration_hands_out, backlight_duration_hands_in, backlight_duration_powered, backlight-timed, led_control, led_zone_, rgb_control,
        rgb_zone_, brightness_control, per-key-lighting, fn-swap, persistent-remappable-keys, disable-keyboard-keys, crown-smooth, divert-crown, divert-gkeys,
        m-key-leds, mr-key-led, multiplatform, gesture2-gestures, gesture2-divert, gesture2-params, sidetone, equalizer, adc_power_management]
      _battery: 4100
      _modelId: B03400000000
      _sensitive: {divert-keys: true, thumb-scroll-mode: true}
      _serial: 8CC37C78
      _unitId: 8CC37C78
      _wpid: B034
      change-host: null
      divert-keys: {82: 0, 83: 0, 86: 0, 195: 2, 196: 0}
      dpi: 1000
      hires-scroll-mode: false
      hires-smooth-invert: false
      hires-smooth-resolution: false
      reprogrammable-keys: {80: 80, 81: 81, 82: 82, 83: 83, 86: 86, 195: 195, 196: 196}
      scroll-ratchet: 2
      smart-shift: 10
      thumb-scroll-invert: false
      thumb-scroll-mode: true
    - _NAME: MX Mechanical
      _absent: [hi-res-scroll, lowres-scroll-mode, hires-smooth-invert, hires-smooth-resolution, hires-scroll-mode, scroll-ratchet, smart-shift, thumb-scroll-invert,
        thumb-scroll-mode, onboard_profiles, report_rate, report_rate_extended, pointer_speed, dpi, dpi_extended, speed-change, backlight_level, backlight_duration_hands_out,
        backlight_duration_hands_in, backlight_duration_powered, backlight-timed, led_control, led_zone_, rgb_control, rgb_zone_, brightness_control, per-key-lighting,
        reprogrammable-keys, persistent-remappable-keys, crown-smooth, divert-crown, divert-gkeys, m-key-leds, mr-key-led, gesture2-gestures, gesture2-divert,
        gesture2-params, sidetone, equalizer, adc_power_management]
      _battery: 4100
      _modelId: B36600000000
      _sensitive: {hires-scroll-mode: ignore, hires-smooth-invert: ignore, hires-smooth-resolution: ignore}
      _serial: 03323E67
      _unitId: 03323E67
      _wpid: B366
      backlight: 0
      change-host: null
      disable-keyboard-keys: {1: false, 2: false, 4: false, 8: false, 16: false}
      divert-keys: {10: 0, 110: 0, 111: 0, 199: 0, 200: 0, 212: 0, 226: 0, 227: 0, 228: 0, 229: 0, 230: 0, 231: 0, 232: 0, 233: 0, 259: 0, 264: 0, 266: 0, 267: 0,
        268: 0, 269: 0, 270: 0, 271: 0, 272: 0, 273: 0, 274: 0, 275: 0, 276: 0, 277: 0, 278: 0, 279: 0, 280: 0, 281: 0, 282: 0, 283: 0, 284: 0, 286: 0}
      fn-swap: false
      multiplatform: 0
    '';
  };

  home.file.".config/solaar/rules.yaml" = {
    enable = true;
    force = true;
    text = 
    ''
    %YAML 1.3
    ---
    - MouseGesture: Mouse Right
    - KeyPress:
      - [Super_L, Page_Down]
      - click
    ...
    ---
    - MouseGesture: Mouse Left
    - KeyPress:
      - [Super_L, Page_Up]
      - click
    ...
    ---
    - MouseGesture: Mouse Up
    - KeyPress:
      - [Super_L, w]
      - click
    ...
    ---
    - MouseGesture: Mouse Down
    - KeyPress:
      - [Super_L, a]
      - click
    ...
    ---
    - MouseGesture: Back Button
    - KeyPress:
      - XF86_Back
      - click
    ...
    ---
    - Key: [Forward Button, pressed]
    - KeyPress:
      - XF86_Forward
      - click
    ...
    ---
    - Test: thumb_wheel_up
    - KeyPress:
      - XF86_AudioRaiseVolume
      - click
    ...
    ---
    - Test: thumb_wheel_down
    - KeyPress:
      - XF86_AudioLowerVolume
      - click
    ...
    '';
  };  

  home.file.".config/autostart/solaar.desktop" = {
    enable = true;
    force = true;
    text = 
    ''
    [Desktop Entry]
    Name=Solaar
    Comment=Logitech Unifying Receiver peripherals manager
    Comment[fr]=Gestionnaire de périphériques pour les récepteurs Logitech Unifying
    Comment[hr]=Upravitelj Logitechovih uređaja povezanih putem Unifying i Nano prijemnika
    Comment[ru]=Управление приёмником Logitech Unifying Receiver
    Comment[de]=Logitech Unifying Empfänger Geräteverwaltung
    Comment[es]=Administrador de periféricos de Logitech Receptor Unifying
    Comment[pl]=Menedżer urządzeń peryferyjnych odbiornika Logitech Unifying
    Exec=solaar --window=hide
    Icon=solaar
    StartupNotify=true
    Terminal=false
    Type=Application
    Keywords=logitech;unifying;receiver;mouse;keyboard;
    Categories=Utility;GTK;
    #Categories=Utility;GTK;Settings;HardwareSettings;
    '';
  };    
}