{ pkgs, inputs, ... }:
{
   #packages.x86_64-linux.default = fenix.packages.x86_64-linux.default.toolchain;


   environment.systemPackages = with pkgs; [   
     lorri
     vscode
     git
     jetbrains.rust-rover
     direnv
   ];
}
