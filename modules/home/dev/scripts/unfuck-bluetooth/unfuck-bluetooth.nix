{
  config,
  pkgs,
  lib,
  ...
}:

let
  unfuck-bluetooth = pkgs.writeShellScriptBin "unfuck-bluetooth" ''
    set -euo pipefail

    # Dependencies just for this script
    PATH=${
      lib.makeBinPath [
        pkgs.coreutils # sleep
        pkgs.util-linux # rfkill
        pkgs.systemd # systemctl
        pkgs.procps # pkill
        pkgs.kmod # modprobe
        pkgs.bluez # bluetoothctl
        pkgs.sudo # sudo
      ]
    }:$PATH

    ${builtins.readFile ./unfuck-bluetooth.sh}
  '';
in
{
  options."unfuck-bluetooth".enable = lib.mkEnableOption "Enable bluetooth reset script";

  config = lib.mkIf config."unfuck-bluetooth".enable {
    home.packages = [
      unfuck-bluetooth
    ];
  };
}
