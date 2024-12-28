{ config, lib, pkgs, ... }:
{
  home = {
    username = "rub";
    homeDirectory = "/home/rub";
    packages = with pkgs; [
        home-manager
        kitty
        wezterm
        neovim
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
        zoxide
    ];
    # Don't change this after the first build
    stateVersion = "24.11";
  };

programs.git = {
    enable = true;
};
programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local mux = wezterm.mux
      local act = wezterm.action

      local config = {}
      if wezterm.config_builder then
        config = wezterm.config_builder()
      end
      
      config.default_prog = { '/run/current-system/sw/bin/bash', '-c', 'tmux attach || tmux new-session' }

      config.enable_kitty_graphics = true
      config.enable_wayland = false
      config.front_end = "WebGpu"
      config.use_ime = true
      config.enable_tab_bar = false
      config.color_scheme = 'Dracula'
      config.font = wezterm.font('JetBrains Mono')

      config.foreground_text_hsb = {
        hue = 1.0,
        saturation = 1.2,
        brightness = 1.5,
      }

      config.background = {
        {
          source = { File = '/home/rub/Pictures/wallpaper.jpg' },
          opacity = 1,
          hsb = { brightness = 0.01 },
        }
      }

      return config
    '';
};

  home.file.".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/nixos-config/dotfiles/.tmux.conf";

  programs.tmux = {
    enable = true;
    escapeTime = 0;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
      continuum
      dracula
    ];
  };

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/nixos-config/dotfiles/.config/nvim";
}
