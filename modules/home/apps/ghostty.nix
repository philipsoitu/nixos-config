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
          "ctrl+shift+a=select_all"
          "ctrl+shift+c=copy_to_clipboard"
          "ctrl+shift+i=inspector:toggle"
          "ctrl+shift+j=write_screen_file:paste"
          "ctrl+shift+q=quit"
          "ctrl+shift+v=paste_from_clipboard"
          "ctrl+shift+comma=reload_config"
          "ctrl+shift+page_up=jump_to_prompt:-1"
          "ctrl+shift+page_down=jump_to_prompt:1"
          "ctrl+zero=reset_font_size"
          "ctrl+comma=open_config"
          "ctrl+minus=decrease_font_size:1"
          "ctrl+plus=increase_font_size:1"
          "ctrl+equal=increase_font_size:1"
          "ctrl+insert=copy_to_clipboard"
          "ctrl+enter=toggle_fullscreen"
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

