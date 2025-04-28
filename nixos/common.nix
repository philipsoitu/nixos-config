{ config, pkgs, lib, home-manager, ... }:

{
  imports = [
    # Include Home Manager module
    home-manager.nixosModules.home-manager
  ];

  # General system configurations
  system.stateVersion = "24.11";

  # Allow unfree packages 
  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # i3wm setup
  services.xserver = {

    # Enable the X11 server
    enable = true;

    # Enable i3 window manager
    windowManager.i3.enable = true;

    # Enable Rofi as the application launcher and
    # Enable Picom as the compositor
    displayManager.sessionCommands = ''
      ${pkgs.rofi}/bin/rofi -show drun &
      ${pkgs.picom}/bin/picom &
    '';

  };

  services.geoclue2.enable = true;


  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  users.users.phil = {
    isNormalUser = true;
    description = "phil";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no"; #Good security practice
      PasswordAuthentication = false;
      PubkeyAuthentication = true;
      Port = 2222;
    };
  };

  networking.firewall.allowedTCPPorts = [ 2222 ];
  networking.firewall.allowedUDPPorts = [ ];


  environment.systemPackages = with pkgs; [
    git
    vim
    polybar
    ghostty
    neovim
    firefox
    neofetch

    libgcc
    gcc
    lazygit
    fzf
    fd
    ripgrep

    jdk23
    python3
    spotify
    openconnect_openssl
    vscode
    rustdesk

    nodejs_23
  ];

  # Home Manager settings
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}

