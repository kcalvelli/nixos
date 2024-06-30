{ pkgs, inputs, ... }:
{
  networking = {
    networkmanager.enable = true;
    useNetworkd = true;
    useDHCP = false;
    firewall.enable = false;
  };

  services = {
    resolved.enable = true;
    openssh.enable = true;
  };

  programs.mtr.enable = true;
  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [ openssl ];

  # For RTL-SDR
  hardware.rtl-sdr.enable = true;
}
