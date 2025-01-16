{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  nix = {
    #package = pkgs.nixVersions.git;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 5d";
    };

    settings = {
      download-buffer-size = 256 * 1024 * 1024;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      # Need swap, until then  
      max-jobs = 16;
      auto-optimise-store = true;
      substituters = [
        "https://cosmic.cachix.org/"
      ];
      trusted-public-keys = [
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      ];
      trusted-users = [ "root" ];
    };
  };

  # Allow unfree
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    hostPlatform = lib.mkDefault "x86_64-linux";
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
