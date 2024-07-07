{ config, pkgs, lib, ... }:

let 
  wallpaper = "/etc/nixos/assets/wallpaper.jpg"; 
  wallpaper_i3lock = "/etc/nixos/assets/wallpaper_i3lock.png"; 
  mod = "Mod4";
in {

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      keybindings = lib.mkOptionDefault {
        "${mod}+p" = "exec ${pkgs.dmenu}/bin/dmenu_run";
        #"${mod}+Shift+Print" = "exec sh -c '[ ! -d /home/${config.home.username}/Pictures ] && mkdir /home/${config.home.username}/Pictures ; ${pkgs.maim}/bin/maim --select \"/home/${config.home.username}/Pictures/$(date +\"%m%M%N\").png\"'";

        # Focus
        "${mod}+j" = "focus left";
        "${mod}+k" = "focus down";
        "${mod}+l" = "focus up";
        "${mod}+semicolon" = "focus right";

	"${mod}+d" = "exec sh -c '${pkgs.rofi}/bin/rofi -modi drun -show drun'";
	"${mod}+Shift+x" = "exec sh -c '${pkgs.i3lock}/bin/i3lock -i ${wallpaper_i3lock}'";
        "${mod}+Shift+Return" = "exec sh -c 'firefox'";
      };

      # Adding the wallpaper and starting kime for korean input 
      startup = [
        { command = "${pkgs.nitrogen}/bin/nitrogen --set-scaled --save ${wallpaper}"; always = true; }
        { command = "${pkgs.kime}/bin/kime-xim"; always = true; notification = false; }
      ];
    };

    extraConfig = "default_border none\n";
  };
}
