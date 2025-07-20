{ config, pkgs, callPackage, ... }: 

{
  environment.pathsToLink = [ "/libexec" ]; 

  services.xserver = {
    enable = true;
    dpi = 192;

    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
        defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
     ];
    };
  };
  programs.i3lock.enable = true; #default i3 screen locker
}
