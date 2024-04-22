{
  nix.settings = {
    substituters = [ 
      "https://cosmic.cachix.org/" 
      "https://devenv.cachix.org"
    ];
    trusted-public-keys = [ 
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" 
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];
    trusted-users = [ "root" "keith" ];
  };
}