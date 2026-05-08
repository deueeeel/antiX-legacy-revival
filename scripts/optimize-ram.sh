#!/bin/bash
# RAM optimization for legacy hardware (<512MB)

echo "=== RAM before optimization ==="
free -h

# Enable zram
sudo apt-get install -y zram-tools
sudo systemctl enable zramswap && sudo systemctl start zramswap

# Disable non-essential services
SERVICES=("bluetooth" "cups" "avahi-daemon")
for service in "${SERVICES[@]}"; do
  sudo systemctl disable "$service" 2>/dev/null && echo "Disabled: $service"
done

echo ""
echo "=== RAM after optimization ==="
free -h
