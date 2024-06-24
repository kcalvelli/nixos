{ pkgs, inputs, ... }:
{
   environment.systemPackages = with pkgs; [
     # Rolling with Zed for a minute
     zed-editor
     #vscode
     #jetbrains.rust-rover
     inputs.self.packages.${pkgs.system}.cursor
     nil
     lapce
   ];
   programs.direnv.enable = true;
   services.lorri.enable = true;
}
