{ pkgs, ... }:
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
      auto-optimise-store = true;
      substituters = [
        "https://cosmic.cachix.org/"
        "https://devenv.cachix.org"
        "https://cache.garnix.io"
        "https://cosmic.cachix.org/"
        "https://drakon64-nixos-cosmic.cachix.org/"

      ];
      trusted-public-keys = [
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
        "drakon64-nixos-cosmic.cachix.org-1:bW2gsh5pbdMxcI3sklvtROM9A8CXtPXgVwmIcO3E3io="
      ];
      trusted-users = [
        "root"
        "keith"
      ];
    };
  };

  # Allow unfree
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}
