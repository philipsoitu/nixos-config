{ self, inputs, ... }:
{

  flake.nixosModules.ghostty =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.ghostty
      ];
    };

  perSystem =
    { pkgs, lib, ... }:
    let
      ghosttyConfig = pkgs.writeText "ghostty-config" ''
        palette =  0 = ${self.theme.base02}
        palette =  1 = ${self.theme.base06}
        palette =  2 = ${self.theme.base09}
        palette =  3 = ${self.theme.base07}
        palette =  4 = ${self.theme.base0A}
        palette =  5 = ${self.theme.base0B}
        palette =  6 = ${self.theme.base08}
        palette =  7 = ${self.theme.base05}
        palette =  8 = ${self.theme.base03}
        palette =  9 = ${self.theme.base06}
        palette = 10 = ${self.theme.base09}
        palette = 11 = ${self.theme.base07}
        palette = 12 = ${self.theme.base0A}
        palette = 13 = ${self.theme.base0B}
        palette = 14 = ${self.theme.base08}
        palette = 15 = ${self.theme.base05}
        background-opacity = 1.0

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
