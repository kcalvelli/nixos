{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    nil
    zed-editor
    nixfmt-rfc-style
    (vscode.override {
      commandLineArgs = [
        "--ozone-platform-hint=auto"
        "--ozone-platform=wayland"
        "--gtk-version=4"
        "--password-store=gnome"
      ];
    })
  ];

  programs.direnv.enable = true;
  services.lorri.enable = true;
}
