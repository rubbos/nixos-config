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
        neovim
        git
        lazygit
        neofetch
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

  # Move the dotfiles config inside home.file
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/dotfiles/.config/nvim";
}
