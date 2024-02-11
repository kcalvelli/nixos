{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ 
     digikam
     vlc
     cubicsdr
     spotify
     obs-studio
     obs-studio-plugins.obs-vaapi
     obs-studio-plugins.obs-gstreamer
     obs-studio-plugins.obs-pipewire-audio-capture 
    ];  
}