{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  environment.systemPackages = with pkgs; [
    (pkgs.nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
      ];
    })
    pkgs.ibm-plex
  ];
}
