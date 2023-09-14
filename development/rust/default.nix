{ inputs, pkgs, fenix, ... }:
{
    packages.x86_64-linux.default = fenix.packages.x86_64-linux.minimal.toolchain;
    nixpkgs.overlays = [ fenix.overlays.default ];
    environment.systemPackages = with pkgs; [
        (fenix.complete.withComponents [
            "cargo"
            "clippy"
            "rust-src"
            "rustc"
            "rustfmt"
        ])
        rust-analyzer-nightly
    ];
}