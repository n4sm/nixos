{ pkgs, packages, lib, ... }:

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
    
    # gui packages 
    rofi
    font-awesome
    maim
    nitrogen
 
    ghidra
    obs-studio
    mpv
  ] ++ [packages."x86_64-linux".ida-free];

  programs.bash = {
    enable = true;
    historySize = 10000;
    enableCompletion = true;
  };

  programs.git = {
    userEmail = "n4sm@pm.me";
    userName = "n4sm";
    enable = true;
  };
  
  # i3status-rust

  programs.i3status-rust = {
      enable = true;
      bars = {
        top = {
		blocks = [
		     {
		       block = "time";
		       interval = 60;
		       format = " $timestamp.datetime(f:'%a %d/%m %R') ";
		     }
		  ];
	  settings = {
	    theme =  {
	      theme = "nord-dark";
	    };
	  };
	  #icons = "awesome5";
	  theme = "nord-dark";
        };
      };
    };

  xsession.windowManager.i3.config = {
    bars = [
      {
        position = "top";
        statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
      }
    ];
  };

  imports = [ 
    (./i3.nix)
    (./xterm.nix)
  ];

  home.stateVersion = "23.11";
}
