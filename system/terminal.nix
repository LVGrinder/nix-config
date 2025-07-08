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
        tmuxPlugins.cpu
        tmuxPlugins.battery
        tmuxPlugins.resurrect
        # tmuxPlugins.continuum
      ];

      # extraConfigBeforePlugins = ''
      #                   # for catppuccin
      #                 # ~/.tmux.conf
      #
      #           # Options to make tmux more pleasant
      #           set -g mouse on
      #           set -g default-terminal "tmux-256color"
      #
      #           # Configure the catppuccin plugin
      #           set -g @catppuccin_flavor "mocha"
      #           set -g @catppuccin_window_status_style "rounded"
      #
      #           # Load catppuccin
      #           run ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux
      #           # For TPM, instead use `run ~/.config/tmux/plugins/tmux/catppuccin.tmux`
      #
      #           # Make the status line pretty and add some modules
      #           set -g status-right-length 100
      #           set -g status-left-length 100
      #           set -g status-left ""
      #           set -g status-right "#{E:@catppuccin_status_application}"
      #           set -agF status-right "#{E:@catppuccin_status_cpu}"
      #           set -ag status-right "#{E:@catppuccin_status_session}"
      #           set -ag status-right "#{E:@catppuccin_status_uptime}"
      #           set -agF status-right "#{E:@catppuccin_status_battery}"
      #
      #           set -g @plugin 'tmux-plugins/tmux-resurrect'
      #           set -g @plugin 'tmux-plugins/tmux-continuum'
      #
      #           run ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
      #           run ${pkgs.tmuxPlugins.battery}/share/tmux-plugins/battery/battery.tmux
      #           run ${pkgs.tmuxPlugins.continuum}/share/tmux-plugins/continuum/continuum.tmux
      #
      #           # set -g @plugin 'tmux-plugins/tmux-resurrect'
      #           # set -g @plugin 'tmux-plugins/tmux-continuum'
      #           # Or, if using TPM, just run TPM;
      #           resurrect_dir="$HOME/.tmux/resurrect"
      #   set -g @resurrect-dir $resurrect_dir
      #   set -g @resurrect-hook-post-save-all 'target=$(readlink -f $resurrect_dir/last); sed "s| --cmd .*-vim-pack-dir||g; s|/etc/profiles/per-user/$USER/bin/||g; s|/home/$USER/.nix-profile/bin/||g" $target | sponge $target'
      # '';
    };

    # {
    #   plugin = pkgs.
    #
    #
    # }

    fish = {
      enable = true;
    };
  };
}
