{ inputs, pkgs, ... }:

{
  # Allow unfree
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}