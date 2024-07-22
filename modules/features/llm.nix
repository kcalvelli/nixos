{ config, lib, pkgs, ... }:
let 
  cfg = config.features;
in 
{
  options = {
    features.llm = {
      enable = lib.mkEnableOption "llm";
    };
  };

  config = lib.mkMerge [
      (lib.mkIf cfg.llm.enable {
        services.ollama = {
          enable = true;
          acceleration = "rocm";
        };
      })
  ];    
}