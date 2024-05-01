{ pkgs, ... }:
{
  nix = {
    package = pkgs.nixFlakes;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      substituters = [ 
        "https://cosmic.cachix.org/" 
        "https://devenv.cachix.org"
        "https://cache.garnix.io"
      ];
      trusted-public-keys = [ 
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" 
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
      trusted-users = [ "root" "keith" ];
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