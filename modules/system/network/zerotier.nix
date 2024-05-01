{ ... }:
{
  services.zerotierone = {
    enable = true;
    joinNetworks = [
      "calvelli_zero"
    ];
  };
}