{ lib, pkgs, inputs, ... }:
{
  nix = {
    package = pkgs.nixFlakes;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 5d";
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    # Need swap, until then  
      max-jobs = 2;
      auto-optimise-store = true;
      substituters = [
        "https://devenv.cachix.org"
        "https://cosmic.cachix.org/"
        "https://drakon64-nixos-cosmic.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
        "drakon64-nixos-cosmic.cachix.org-1:bW2gsh5pbdMxcI3sklvtROM9A8CXtPXgVwmIcO3E3io="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      trusted-users = [
        "root"
      ];
    };
  };

  # Allow unfree
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    hostPlatform = lib.mkDefault "x86_64-linux";   
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}