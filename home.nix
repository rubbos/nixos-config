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

  home.file.".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/dotfiles/.tmux.conf";

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
      continuum
      dracula
    ];
  };

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/dotfiles/.config/nvim";
}
