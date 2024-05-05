{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
     noson
     gimp
     celluloid
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

