{ config, pkgs, lib, ... }:

{
  xresources.properties = {
    "*faceName" = "DejaVu Sans Mono";
    "*faceSize" = 15;
    "*termName" = "xterm-256color";
    "*ttyModes" = "erase ^?";
    "*VT100.backarrowkey" = false;

    "*foreground" = "#dcdccc";
    "*background" = "#1f1f1f";
    "vt100.geometry" = "80x60";
 
    # My Kitty colorscheme
    "*VT100.color0"  = "#404040";
    "*VT100.color8"  = "#666666";
    #: black

    "*VT100.color1"  = "#b75757";
    "*VT100.color9"  = "#ce8d8d";
    #: red

    "*VT100.color2"  = "#87b757";
    "*VT100.color10" = "#adce8d";
    #: green

    "*VT100.color3"  = "#b7b757";
    "*VT100.color11" = "#cece8d";
    #: yellow

    "*VT100.color4"  = "#5777b7";
    "*VT100.color12" = "#8da3ce";
    #: blue

    "*VT100.color5"  = "#b757b7";
    "*VT100.color13" = "#ce8dce";
    #: magenta

    "*VT100.color6"  = "#57b7b7";
    "*VT100.color14" = "#8dcece";
    #: cyan

    "*VT100.color7"  = "#dddddd";
    "*VT100.color15" = "#ffffff";
    #: white

    "*VT100.metaSendsEscape" = true;
    "*VT100*translations" = ''#override \n\
      Ctrl <Key>-: smaller-vt-font() \n\
      Ctrl <Key>+: larger-vt-font() \n\
      Ctrl Shift <Key>C: copy-selection(CLIPBOARD) \n\
      Ctrl Shift <Key>V: insert-selection(CLIPBOARD) \n\
      Alt <Key>I: set-reverse-video(toggle) \n\
    '';
  };
}
