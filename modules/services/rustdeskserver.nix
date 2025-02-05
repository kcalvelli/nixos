{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services;
  domain = config.networking.hostName;
  tailnet = "taile0fb4.ts.net";
in
{
  options = {
    services.rustdeskserver = {
      enable = lib.mkEnableOption "rustdeskserver";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.rustdeskserver.enable {
      services = {
        rustdesk-server = {
          enable = true;
          relay.enable = true;
          signal.enable = true;
          openFirewall = true;
        };
      };
    })
  ];
}
