{ config, pkgs, ... }:

{
  programs = {
    tmux = {
      enable = true;
      shortcut = "a";
      clock24 = true;
      keyMode = "vi";
      plugins = with pkgs; [
        tmuxPlugins.catppuccin
      ];
      extraConfig = "
# Options to make tmux more pleasant

set -g mouse on
set -g default-terminal 'tmux-256color'

# Configure the catppuccin plugin
set -g @catppuccin_flavor 'mocha' # latte, frappe, macchiato, or mocha
set -g @catppuccin_window_status_style 'rounded' # basic, rounded, slanted, custom, or none

# Load catppuccin
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux
# For TPM, instead use `run ~/.config/tmux/plugins/tmux/catppuccin.tmux`

# Make the status line pretty and add some modules
set -g status-right-length 100
set -g status-left-length 100
set -g status-left ''
set -g status-right '#{E:@catppuccin_status_application}'
set -agF status-right '#{E:@catppuccin_status_cpu}'
set -ag status-right '#{E:@catppuccin_status_session}'
set -ag status-right '#{E:@catppuccin_status_uptime}'
set -agF status-right '#{E:@catppuccin_status_battery}'

run ~/.config/tmux/plugins/tmux-plugins/tmux-cpu/cpu.tmux
run ~/.config/tmux/plugins/tmux-plugins/tmux-battery/battery.tmux
# Or, if using TPM, just run TPM
        ";

    };
    fish = {
      enable = true;
    };
  };
}
