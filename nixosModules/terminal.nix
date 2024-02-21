{ pkgs, ... }:
{

  programs.starship = {
 #   enable = true;
 #   enableFishIntegration = true;
 #   settings = {
 #       add_newline = false;
 #   
 #       character = {
 #         success_symbol = "[➜](bold green)";
 #         error_symbol = "[➜](bold red)";
 #       };
 #   };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    set fish_greeting # Disable greeting
    direnv hook fish | source
    '';
    #plugins = [
    #  # Enable a plugin (here grc for colorized command output) from nixpkgs
    #  { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    #  { name = "github-copilot-cli-fish"; src = pkgs.fishPlugins.github-copilot-cli-fish.src; }
    #
    #  # Manually packaging and enable a plugin
    #];
  };

  environment.systemPackages = with pkgs; [
    ripgrep
    neofetch
    helix
    vim 
    wget
    curl
    gnugrep
  ];   
}