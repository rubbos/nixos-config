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
        blueman # bluetooth
        swww
        hyprpicker # color picker
        pywal # color scheme from wallpaper
        networkmanager
        swaynotificationcenter # Notifications on waybar
        qogir-icon-theme # Icons
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        brightnessctl # Brightness buttons
        wireplumber # Music buttons
        pywalfox-native #color scheme for firefox/librewolf
        hyprshot # screenshot utility
        lutris
        flatpak
    ];
    # Don't change this after the first build
    stateVersion = "24.11";
  };

  # Hyprland config directory
  home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
  
  gtk = {
    enable = true;
    iconTheme = {
      name = "Qogir";
      package = pkgs.qogir-icon-theme;
    };
  };

  home.file = {
  ".config/waybar/config".source = ./dotfiles/waybar/config;
  ".config/waybar/style.css".source = ./dotfiles/waybar/style.css;
  ".config/waybar/scripts".source = ./dotfiles/waybar/scripts;
  ".config/waybar/assets".source = ./dotfiles/waybar/assets;
  ".config/waybar/themes".source = ./dotfiles/waybar/themes;
  ".config/hypr/wallpaper.sh".source = ./dotfiles/hypr/wallpaper.sh;
  ".config/wofi".source = ./dotfiles/wofi;

};
programs.waybar.enable = true;  
programs.pywal = {
  enable = true;
};
programs.librewolf.nativeMessagingHosts = [ pkgs.pywalfox-native ];


programs.git = {
      enable = true;
  };

  programs.wezterm = {
      enable = true;
      enableBashIntegration = true;
      extraConfig = builtins.readFile ./dotfiles/wezterm.lua;
  };

    home.file."kitty.conf".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/nixos-config/dotfiles/kitty/kitty.conf";

      programs.kitty = {
    enable = true;
    extraConfig = ''
      include ~/.config/kitty/current-theme.conf
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
