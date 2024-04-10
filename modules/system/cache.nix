{
  nix.settings = {
    substituters = [ 
      "https://cosmic.cachix.org/" 
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [ 
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" 
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };  
}