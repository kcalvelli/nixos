{ pkgs, ... }:
{
   #packages.x86_64-linux.default = fenix.packages.x86_64-linux.default.toolchain;


   environment.systemPackages = with pkgs; [   
     #This is not ready for prime time
     zed-editor
     vscode
     jetbrains.rust-rover
   ];
   programs.direnv.enable = true;
   services.lorri.enable = true;
}
