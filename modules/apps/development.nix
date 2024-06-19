{ pkgs, ... }:
{
   #packages.x86_64-linux.default = fenix.packages.x86_64-linux.default.toolchain;


   environment.systemPackages = with pkgs; [
     # Rolling with Zed for a minute
     zed-editor
     #vscode
     #jetbrains.rust-rover
   ];
   programs.direnv.enable = true;
   services.lorri.enable = true;
}
