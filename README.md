# NixOS Configuration

Quick steps to install these configs:

```bash
# 1. Clone the repo
git clone https://github.com/yourusername/nixos-config.git
cd nixos-config

# 2. Apply your host config (replace <host> with "framework" or "desktop")
sudo nixos-rebuild switch --flake .#<host>
```

make sure you have flakes enabled beforehand
