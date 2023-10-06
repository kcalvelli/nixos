{config, pkgs, lib,...}: 
{
  environment.systemPackages = with pkgs; [
    kmail
  ] ++ (with pkgs.libsForQt5; [
    kdepim-runtime
    merkuro
  ]);
  
}
