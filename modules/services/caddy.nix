{ config, lib, pkgs, ... }:
let 
  cfg = config.services;
  domain = config.networking.hostName;
  tailnet = "taile0fb4.ts.net";
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
     };
     networking.firewall.allowedTCPPorts = [
       80
       443
     ];
   })
  ];
}