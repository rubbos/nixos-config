{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "rub";
    homeDirectory = "/home/rub";
    packages = with pkgs; [
        home-manager
        nodejs_23
        python313
        unzip
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
        syncthing
        ani-cli
        obsidian
    ];
    # Don't change this after the first build
    stateVersion = "24.11";
  };

  # Use declarative config file for Hyprland
  xdg.configFile."hypr/hyprland.conf".source = ./dotfiles/hyprland.conf;

  programs.git = {
      enable = true;
  };
  programs.wezterm = {
      enable = true;
      enableBashIntegration = true;
      extraConfig = builtins.readFile ./dotfiles/wezterm.lua;
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
