{ config, lib, pkgs, ... }:
let 
  cfg = config.services;
  domain = config.networking.hostName;
in 
{
  options = {
    services.caddy-proxy = {
      enable = lib.mkEnableOption "caddy-proxy";
    };
  };  

  config = lib.mkMerge [
  (lib.mkIf cfg.caddy-proxy.enable { 
    services.caddy = {
      enable = true;
      globalConfig = ''
         servers {
           metrics
         }
      '';
      virtualHosts."hello.${domain}".extraConfig = ''
        encode gzip
        file_server
          root * ${
            pkgs.runCommand "testdir" {} ''
              mkdir "$out"
              echo hello world > "$out/example.html"
           ''
          }
      '';
     };
     networking.firewall.allowedTCPPorts = [
       80
       443
     ];
   })
  ];
}