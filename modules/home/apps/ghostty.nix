{ config, lib, pkgs, ... }:

{
  options.ghostty.enable = lib.mkEnableOption "Enable ghostty";

  config = lib.mkIf config.ghostty.enable {
    programs.ghostty = {
      enable = true;

      clearDefaultKeybinds = true;

      settings = {
        theme = "Gruvbox Dark";
        background-opacity = 0.9;

        font-feature = "-calt, -liga, -dlig";


        font-size = 13;
        window-inherit-font-size = true;


        window-padding-balance = true;
        window-padding-x = 0;
        window-padding-y = 0;

        keybind = [
          "super+ctrl+shift+plus=equalize_splits"
          "super+ctrl+shift+up=resize_split:up,10"
          "super+ctrl+shift+down=resize_split:down,10"
          "super+ctrl+shift+right=resize_split:right,10"
          "super+ctrl+shift+left=resize_split:left,10"
          "ctrl+alt+shift+j=write_screen_file:open"
          "super+ctrl+left_bracket=goto_split:previous"
          "super+ctrl+right_bracket=goto_split:next"
          "ctrl+alt+up=goto_split:up"
          "ctrl+alt+down=goto_split:down"
          "ctrl+alt+right=goto_split:right"
          "ctrl+alt+left=goto_split:left"
          "ctrl+shift+a=select_all"
          "ctrl+shift+c=copy_to_clipboard"
          "ctrl+shift+e=new_split:down"
          "ctrl+shift+i=inspector:toggle"
          "ctrl+shift+j=write_screen_file:paste"
          "ctrl+shift+n=new_window"
          "ctrl+shift+o=new_split:right"
          "ctrl+shift+q=quit"
          "ctrl+shift+t=new_tab"
          "ctrl+shift+v=paste_from_clipboard"
          "ctrl+shift+w=close_tab"
          "ctrl+shift+comma=reload_config"
          "ctrl+shift+right=next_tab"
          "ctrl+shift+left=previous_tab"
          "ctrl+shift+page_up=jump_to_prompt:-1"
          "ctrl+shift+page_down=jump_to_prompt:1"
          "ctrl+shift+enter=toggle_split_zoom"
          "ctrl+shift+tab=previous_tab"
          # "alt+one=goto_tab:1"
          # "alt+two=goto_tab:2"
          # "alt+three=goto_tab:3"
          # "alt+four=goto_tab:4"
          # "alt+five=goto_tab:5"
          # "alt+six=goto_tab:6"
          # "alt+seven=goto_tab:7"
          # "alt+eight=goto_tab:8"
          # "alt+nine=last_tab"
          "alt+f4=close_window"
          "ctrl+zero=reset_font_size"
          "ctrl+comma=open_config"
          "ctrl+minus=decrease_font_size:1"
          "ctrl+plus=increase_font_size:1"
          "ctrl+equal=increase_font_size:1"
          "ctrl+insert=copy_to_clipboard"
          "ctrl+page_up=previous_tab"
          "ctrl+page_down=next_tab"
          "ctrl+enter=toggle_fullscreen"
          "ctrl+tab=next_tab"
          "shift+up=adjust_selection:up"
          "shift+down=adjust_selection:down"
          "shift+right=adjust_selection:right"
          "shift+left=adjust_selection:left"
          "shift+home=scroll_to_top"
          "shift+end=scroll_to_bottom"
          "shift+insert=paste_from_selection"
          "shift+page_up=scroll_page_up"
          "shift+page_down=scroll_page_down"
        ];
      };
    };
  };
}

