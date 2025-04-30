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
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu" "kvm" ];
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

    virt-manager
    virt-viewer
    spice
    spice-gtk
    win-virtio
    win-spice

    wget
  ];

  # Home Manager settings
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;


  # kvm minecraft!!
  boot.kernelModules = [ 
    "kvm-amd"
    "vfio"
    "vfio_pci"
    "vfio_iommu_type1"
  ];

  boot.kernelParams = [ 
    "amd_iommu=on"
    "iommu=pt"
  ];


  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
      ovmf.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
    };
  };

  systemd.tmpfiles.rules = [
    "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"
  ];


}

