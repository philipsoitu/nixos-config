# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, outputs, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager

      # ./ssh.nix
      # ./tmux.nix
      # ./picom.nix
      # ./networking.nix
    ];

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_CA.UTF-8";


  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  hardware.opengl.enable = true;

  services.displayManager.defaultSession = "none+i3";
  services.xserver.desktopManager.xterm.enable = false;

  documentation.man.generateCaches = true;

  environment.pathsToLink = [ "/libexec" ];
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    extraPackages = with pkgs; [
      dmenu
      i3status
      i3lock
      i3blocks
    ];
    configFile = "./i3.conf";
  };

  environment.etc."i3.conf".text = pkgs.callPackage ./i3-config.nix {};

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.mutableUsers = false;
  users.users.phil = {
     isNormalUser = true;
     description = "phil";
     extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    vim
    neovim 
    curl
    wget
    firefox
    htop
    dmenu
    ghostty

    git

    unzip
    feh
    fzf
    jq
    rofi
    nitrogen
    ranger
    tree
    watch
    bat
    file
    killall
    patchelf
    direnv

    dunst
    viewnior
    mpd
    mpc_cli
    acpi
    brightnessctl
    scrot
    libnotify

    lxappearance
    networkmanagerapplet

    mc
    sshfs
    graphviz
    pandoc
    gnuplot

    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
  ];


  environment.variables = {
    EDITOR = "vim";
    TERMINAL = "ghostty";
    BROWSER = "firefox";
  };


  system.stateVersion = "24.11"; # Did you read the comment?
}

