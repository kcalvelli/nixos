  
{ ... }:
{  
  virtualisation.oci-containers = {
    backend = "podman";
    containers.homeassistant = {
      volumes = [ 
        "home-assistant:/config" 
        "/mnt/media:/media"
        "/run/dbus:/var/run/dbus"
      ];
      environment.TZ = "America/New_York";
      image = "ghcr.io/home-assistant/home-assistant:stable"; # Warning: if the tag does not change, the image will not be updated
      extraOptions = [ 
        "--network=host" 
      ];
    };
  };
}  