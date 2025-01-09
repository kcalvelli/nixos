{ lib, pkgs, inputs, ... }:
{
  imports =  [
    inputs.vscode-server.nixosModules.default
  ];
  environment.systemPackages = with pkgs; [
    devenv
    nil
    nixfmt-rfc-style
    vim
    starship
    fish
    gcc
    github-desktop

    code-cursor
    vscode 
    
    nvchad
  ];  
  nixpkgs.overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
  ];
  programs.direnv.enable = true;
  services.lorri.enable = true;  
  programs.git.enable = true;   
  services.vscode-server.enable = true;

  # Launch Fish when interactive shell is detected
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
