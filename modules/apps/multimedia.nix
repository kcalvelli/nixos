{
  pkgs,
  config,
  inputs,
  ...
}:
{
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=13 card_label="OBS Virtual Camera" exclusive_caps=1
  '';

  environment.systemPackages = with pkgs; [
    gimp
    celluloid
    loupe
    # OBS with plugins
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        obs-backgroundremoval
        obs-gstreamer
        obs-vaapi
      ];
    })

    # codecs
    mpg123
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-base

    ffmpeg-full
  ];
}
