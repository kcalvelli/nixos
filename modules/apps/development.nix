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
           sha256 = "1ph1rv97z9qm3g9wg9w80rpdfarazd1jsi1s6m5lczpgynrrhwak";          
         };
       }  
     ))  
   ];

   programs.direnv.enable = true;
   services.lorri.enable = true;
}
