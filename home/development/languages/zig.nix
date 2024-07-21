{ inputs, config, pkgs, lib, ...}:
with lib; let
  cfg = config.languages.zig;
in {

  options = {
    languages.zig = {
      enable = mkEnableOption "zig";
      package = mkPackageOption pkgs "zigup" {};
      lsp = mkOption {
        default = true;
        type = types.bool;
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages =
      [
        cfg.package
      ]
      ++ (
        if cfg.lsp
        then [pkgs.zls]
        else []
      );
  };
}