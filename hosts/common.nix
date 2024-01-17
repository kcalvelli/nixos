{ inputs, outputs, pkgs, ... }:

{
  # Allow unfree
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  overlays = [
    # Add overlays your own flake exports (from overlays and pkgs dir):
    outputs.overlays.additions
    outputs.overlays.modifications
    outputs.overlays.unstable-packages
    ];      
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}