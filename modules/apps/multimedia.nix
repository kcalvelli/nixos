{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ 
     
     clapper
     kooha
     pavucontrol
     
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

