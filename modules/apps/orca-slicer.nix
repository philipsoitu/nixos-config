{ self, inputs, ... }:
{
  flake.nixosModules.orca-slicer =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.orca-slicer
      ];

      # Allow Orca Slicer to discover/connect to Bambu Lab printers on the LAN.
      networking.firewall = {
        enable = true;
        allowedUDPPorts = [
          1990
          2021
        ];
        extraCommands = ''
          iptables -I INPUT -m pkttype --pkt-type multicast -j ACCEPT
          iptables -A INPUT -m pkttype --pkt-type multicast -j ACCEPT
        '';
      };
    };

  perSystem =
    { pkgs, self', ... }:
    {
      packages.orca-slicer = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.orca-slicer;
      };
    };
}
