{ config, pkgs, lib, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nasm";
  home.homeDirectory = "/home/nasm";

  home.packages = with pkgs; [
    firefox
    vscodium
    vim
    xterm
    gcc
    gdb
    ungoogled-chromium
    pavucontrol
    
    # i3
    i3status
    i3lock
    rofi
    maim
    feh
    nitrogen
  ];

  programs.bash = {
    enable = true;
    historySize = 10000;
    enableCompletion = true;
  };

  imports = [ 
	(./i3.nix)
	(./xterm.nix)
     ];

  home.stateVersion = "23.11";
}
