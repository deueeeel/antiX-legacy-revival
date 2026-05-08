#!/bin/bash
# Quick clock fix for dead CMOS battery
# Usage: sudo ./fix-clock.sh "2026-01-15 14:30:00"

if [ -z "$1" ]; then
  echo "Usage: sudo ./fix-clock.sh \"YYYY-MM-DD HH:MM:SS\""
  exit 1
fi

sudo date -s "$1"
sudo hwclock --systohc
echo "Clock synced: $(date)"
