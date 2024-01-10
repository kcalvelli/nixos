{
  systemd.services.update_pwas = {
    enable = true;
    description = "Update desktop files for PWA Exec";
    serviceConfig = {
      ExecStart = "/home/keith/.local/share/applications/update_pwa_desktop_files.sh";
    };
  
  };

  systemd.services.update_pwas.path = {
    enable = true;
    description = "Montitor applications directory for changes";
    serviceConfig = {
      PathChanged = "/home/keith/.local/share/applications";
      Unit = "update_pwas.service";
      WantedBy = "multi-user.target";
    };
  };
}