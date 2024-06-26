{ pkgs, inputs, ... }:
{
   environment.systemPackages = with pkgs; [
     nil
     zed-editor
     ((vscode.override { 
         isInsiders = true; 
         commandLineArgs = [
           "--ozone-platform-hint=auto"
           "--ozone-platform=wayland"
           "--gtk-version=4"
           "--password-store=gnome"
         ];       
       }).overrideAttrs (
       oldAttrs: rec {
         version = "latest";
         src = builtins.fetchTarball {
           url = "https://update.code.visualstudio.com/latest/linux-x64/insider";
           sha256 = "1qym5cbb0i9kdzn04l3f5vh5942qjrmlwl32bpya5m3cjx2ky85n";          
         };
       }  
     ))  
   ];

   programs.direnv.enable = true;
   services.lorri.enable = true;
}
