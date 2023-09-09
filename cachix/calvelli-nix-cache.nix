
{
  nix = {
    settings = {
      substituters = [
        "https://calvelli-nix-cache.cachix.org"
      ];
      trusted-public-keys = [
        "calvelli-nix-cache.cachix.org-1:wmpkUk58/e+QQybGe2EQvkb0S2H8Xs4gu3I3zmGcf0U="
      ];
    };
  };
}
