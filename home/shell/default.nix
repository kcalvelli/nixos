{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-airline ];
    settings = {
      ignorecase = true;
    };
    extraConfig = ''
      set mouse=v
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      direnv hook fish | source
    '';
    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      #  { name = "github-copilot-cli-fish"; src = pkgs.fishPlugins.github-copilot-cli-fish.src; }

      # Manually packaging and enable a plugin
    ];

    shellAliases = with pkgs; {
      cat = "${bat}/bin/bat";
      ls = "${eza}/bin/eza";
      top = "${bottom}/bin/bottom";
      du = "${du-dust}/bin/dust";
    };
  };

  programs.atuin.enable = true;

  ##: <https://atuin.sh/docs/config/>
  programs.atuin.settings = {
    dialect = "us";

    search_mode = "fuzzy";
    filter_mode = "directory";
    filter_mode_shell_up_key_binding = "directory";

    # Pseudo-filter for Git repository scope.
    workspaces = true;

    # Hide commands from history by regex pattern.
    # <https://atuin.sh/docs/config/#history_filter>
    history_filter = [
      # "^secret-cmd"
      # "^innocuous-cmd .*--secret=.+"
    ];

    ##: === sync ===

    auto_sync = true;
    sync_frequency = "10m";

    # Opt in to new sync version for existing installs.
    sync.records = true;
  };

  home.packages = with pkgs; [ grc ];
}
