{ ... }:
{

  networking = {
    interfaces.br0.useDHCP = true;
    bridges = {
      br0 = {
        interfaces = [ "enp39s0" ];
      };
    };
  };
}
