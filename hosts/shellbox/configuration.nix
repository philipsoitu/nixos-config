{ self, inputs, ... }:
{

  flake.nixosModules.shellboxConfiguration =

    { config, pkgs, ... }:

    {
      imports = [
        self.nixosModules.shellboxHardware
        self.nixosModules.environment
      ];

      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "shellbox";

      # Configure network proxy if necessary
      # networking.proxy.default = "http://user:password@proxy:port/";
      # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

      # Enable networking
      networking.networkmanager.enable = true;

      # Set your time zone.
      time.timeZone = "America/Toronto";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_CA.UTF-8";

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.phil = {
        isNormalUser = true;
        description = "phil";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        packages = with pkgs; [ ];
      };

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = with pkgs; [
        self.packages.${pkgs.stdenv.hostPlatform.system}.bun-old-cpu
        ttyd
      ];

      systemd.services.ttyd = {
        description = "Browser terminal";

        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
          ExecStart = ''
            ${pkgs.ttyd}/bin/ttyd \
              --interface 127.0.0.1 \
              --port 7681 \
              --writable \
              ${pkgs.bash}/bin/bash
          '';

          Restart = "always";

          User = "phil";
        };
      };

      services.nginx = {
        enable = true;

        recommendedProxySettings = true;
        recommendedTlsSettings = true;

        virtualHosts."shellbox.soitu.ca" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            proxyPass = "http://127.0.0.1:7681";

            proxyWebsockets = true;

            extraConfig = ''
              proxy_set_header Host $host;
              proxy_set_header X-Real-IP $remote_addr;
            '';
          };
        };
      };

      security.acme = {
        acceptTerms = true;
        defaults.email = "philip.soitu@gmail.com";
      };

      networking.firewall.allowedTCPPorts = [
        80
        443
      ];

      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      # programs.mtr.enable = true;
      # programs.gnupg.agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      # };

      # List services that you want to enable:

      # Enable the OpenSSH daemon.
      services.openssh.enable = true;

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewall.allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # networking.firewall.enable = false;

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "25.11"; # Did you read the comment?

    };
}
