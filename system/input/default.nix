{ pkgs, ... }:

{
  # Install logiops package
  environment.systemPackages = [ 
    pkgs.logiops 
    pkgs.solaar
  ];

  # Create systemd service
  systemd.services.logiops = {
    description = "An unofficial userspace driver for HID++ Logitech devices";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.logiops}/bin/logid";
    };
  };

  # Configuration for logiops
  environment.etc."logid.cfg".text = ''
devices: (
{
    name: "MX Master 3S";
    smartshift:
    {
        on: true;
        threshold: 30;
        torque: 50;
    };
    hiresscroll:
    {
        hires: true;
        invert: false;
        target: false;
    };
    dpi: 2000;

    buttons: (
        {
            cid: 0xc3;
            action =
            {
                type: "Gestures";
                gestures: (
                    {
                        direction: "Up";
                        mode: "OnRelease";
                        action =
                        {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA","KEY_UP"];
                        };
                    },
                    {
                        direction: "Down";
                        mode: "OnRelease";
                        action =
                        {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA","KEY_DOWN"];
                        };
                    },
                    {
                        direction: "Left";
                        mode: "OnRelease";
                        action =
                        {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA","KEY_LEFT"];
                        };
                    },
                    {
                        direction: "Right";
                        mode: "OnRelease";
                        action =
                        {
                            type: "Keypress";
                            keys = ["KEY_LEFTMETA","KEY_RIGHT"];
                        }
                    },
                    {
                        direction: "None"
                        mode: "OnRelease";
                        action =
                        {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA"];
                        }
                    }
                );
         
            };
        },
        {
            cid: 0x52;
            action =
            {
                type: "Keypress";
                keys: ["KEY_RIGHTCTRL", "KEY_PRINT"]
            };
        },
        {
            cid: 0xc4;
            action =
            {
                type: "ToggleSmartshift";
            };
        }
    );
}
);
  '';
}