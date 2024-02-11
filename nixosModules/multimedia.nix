{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ 
     digikam
     vlc
     cubicsdr
     spotify
     
     # OBS with plugins
     (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          obs-vaapi
          obs-backgroundremoval
          obs-gstreamer
          obs-pipewire-audio-capture
        ]; 
      })
  ];  
}

