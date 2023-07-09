{ pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'

      return {
        window_background_opacity = 0.96,
        enable_scroll_bar=true,

        color_scheme = 'Black Metal (Burzum) (base16)',

        font = wezterm.font 'FiraCode Nerd Font',

        default_prog = { "fish" },
        scrollback_lines=10000,
        default_cursor_style = "BlinkingBar",
        cursor_blink_rate = 400,
 
        -- Tab bar
        enable_tab_bar = true,
        hide_tab_bar_if_only_one_tab = true,
        -- tab_bar_at_bottom = true,
        use_fancy_tab_bar = false,

        -- Keys
        keys = {
          -- SplitHorizontal
          {
	        key = "(",
	        mods = "CTRL|SHIFT",
	        action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
          },
          -- SplitVertical
          {
	        key = ")",
	        mods = "CTRL|SHIFT",
	        action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
          },
        },       

      }
    '';
  };
}