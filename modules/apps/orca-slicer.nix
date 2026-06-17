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
        extraCommands = ''
          iptables -I INPUT -m pkttype --pkt-type multicast -j ACCEPT
          iptables -A INPUT -m pkttype --pkt-type multicast -j ACCEPT
          iptables -I INPUT -p udp -m udp --match multiport --dports 1990,2021 -j ACCEPT
        '';
      };
    };

  perSystem =
    { pkgs, system, ... }:
    let
      orcaPkgs = import inputs.nixpkgs-orca-slicer {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      packages.orca-slicer = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = orcaPkgs.orca-slicer;
      };
    };
}
