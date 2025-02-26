{ config, lib, pkgs, ... }:
let 
  cfg = config.services.ntopng;
in
{
  options = {
    services.ntopng = {
      enable = lib.mkEnableOption "ntopng";
      port = lib.mkOption {
        type = lib.types.int;
        default = 3000;
        description = "The port on which ntopng will listen";
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      services.ntopng = {
        enable = true;
        port = cfg.port;
      };
    })
  ];

  services.caddy.virtualHosts."ntopng.${domain}.${tailnet}" = {
    extraConfig = ''
      reverse_proxy http://localhost:3000
      encode gzip
    '';
  };
}
