{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  hyprland.enable = true;
  hyprpaper.enable = true;
  pipewire.enable = true;
  sddm.enable = true;
  hyprshot.enable = true;

  minecraft.enable = true;
  printer.enable = true;

  laptop.enable = true;
  school.enable = true;
  rustdesk.enable = true;

  intellij.enable = true;

  environment.systemPackages = [
    pkgs.code-cursor
    pkgs.obs-studio
  ];

  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.graphics.enable = true;

  services.ollama = {
    enable = true;

    package = pkgs.ollama-vulkan;

    loadModels = [
      "qwen2.5:3b"
      "nomic-embed-text"
      "qwen3-embedding:0.6b"
      "qwen3:4b"
      "qwen3:8b"
    ];

    environmentVariables = {
      OLLAMA_VULKAN = "1";
    };
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

}
