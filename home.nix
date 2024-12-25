{ config, lib, pkgs, ... }:
{
  home = {
    username = "rub";
    homeDirectory = "/home/rub";
    packages = with pkgs; [
        home-manager
        vim
        kitty
        wezterm
	tmux
        neovim
        git
        lazygit
        neofetch
	pfetch-rs
        wget
        wofi
        waybar
        hyprpaper
        font-awesome
        protonup
        librewolf
        gnumake
        ripgrep
        fd
        fzf
        stow
    ];
    # Don't change this after the first build
    stateVersion = "24.11";
  };

  programs.tmux = {
    enable = true; 
    extraConfig = ''
	unbind r
	bind r source-file ~/.tmux.conf

	set -g @plugin 'tmux-plugins/tpm'
	set -g @plugin 'tmux-plugins/tmux-sensible'
	set -g @plugin 'tmux-plugins/tmux-resurrect'
	set -g @plugin 'tmux-plugins/tmux-continuum'
	set -g @plugin 'dracula/tmux'

	set -g @resurrect-strategy-nvim 'session'
	set -g @continuum-restore 'on'

	unbind C-b
	set-option -g prefix C-Space
	bind-key C-Space send-prefix

	bind | split-window -h
	bind - split-window -v
	unbind '"'
	unbind %

	set -g mouse on
	set -g default-terminal "tmux-256color"

	set-option -sa terminal-overrides ",xterm*:Tc"
	set-option -g status-position top

	set -g @dracula-plugins "cpu-usage gpu-usage ram-usage network-ping"
	set -g @dracula-cpu-usage-colors "light_purple dark_gray"
	set -g @dracula-network-ping-colors "yellow dark_gray"
	set -g @dracula-show-left-icon " "
	set -g @dracula-show-timezone false
	set -g @dracula-day-month true
	set -g @dracula-time-format "%F %R"
	set -g @dracula-show-location false
	set -g @dracula-show-fahrenheit false

	run -b '~/.tmux/plugins/tpm/tpm'
      "
    '';
  };

  # Move the dotfiles config inside home.file
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/dotfiles/.config/nvim";
}
