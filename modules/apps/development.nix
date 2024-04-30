{ pkgs, ... }:
{
   #packages.x86_64-linux.default = fenix.packages.x86_64-linux.default.toolchain;


   environment.systemPackages = with pkgs; [   
     zed-editor
     vscode
     jetbrains.rust-rover
   ];
   programs.direnv.enable = true;
   services.lorri.enable = true;
}
