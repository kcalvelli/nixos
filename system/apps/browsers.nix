{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #pkgs.brave-browser-nightly 
    #pkgs.brave 
    inputs.self.packages.${pkgs.system}.brave-qt
  ];
}