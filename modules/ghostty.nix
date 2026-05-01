{ self, inputs, ... }:
{
  perSystem =
    { pkgs, lib, ... }:
    let
      ghosttyConfig = pkgs.writeText "ghostty-config" ''
        theme = Rose Pine Moon
        background-opacity = 0.9

        font-feature = -calt, -liga, -dlig

        font-size = 13
        window-inherit-font-size = true

        window-padding-balance = true
        window-padding-x = 0
        window-padding-y = 0

        keybind = clear
        keybind = ctrl+shift+a=select_all
        keybind = ctrl+shift+c=copy_to_clipboard
        keybind = ctrl+shift+i=inspector:toggle
        keybind = ctrl+shift+j=write_screen_file:paste
        keybind = ctrl+shift+q=quit
        keybind = ctrl+shift+v=paste_from_clipboard
        keybind = ctrl+shift+comma=reload_config
        keybind = ctrl+shift+page_up=jump_to_prompt:-1
        keybind = ctrl+shift+page_down=jump_to_prompt:1
        keybind = ctrl+zero=reset_font_size
        keybind = ctrl+comma=open_config
        keybind = ctrl+minus=decrease_font_size:1
        keybind = ctrl+plus=increase_font_size:1
        keybind = ctrl+equal=increase_font_size:1
        keybind = ctrl+insert=copy_to_clipboard
        keybind = ctrl+enter=toggle_fullscreen
        keybind = shift+up=adjust_selection:up
        keybind = shift+down=adjust_selection:down
        keybind = shift+right=adjust_selection:right
        keybind = shift+left=adjust_selection:left
        keybind = shift+home=scroll_to_top
        keybind = shift+end=scroll_to_bottom
        keybind = shift+insert=paste_from_selection
        keybind = shift+page_up=scroll_page_up
        keybind = shift+page_down=scroll_page_down
      '';
    in
    {
      packages.ghostty = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.ghostty;

        flags = {
          "--config-file" = "${ghosttyConfig}";
        };

        flagSeparator = "=";
      };
    };
}
