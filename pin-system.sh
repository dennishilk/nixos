#!/usr/bin/env bash
# ------------------------------------------
# pin-system.sh – Permanently pin the current NixOS generation
# to protect it from garbage collection.
# ------------------------------------------
# © Dennis Hilk / Nebunix Tools

set -euo pipefail

# Get the current system generation
GEN=$(sudo nix-env --list-generations --profile /nix/var/nix/profiles/system \
  | awk '/current/{print $1}')

if [[ -z "$GEN" ]]; then
  echo "❌ No current generation found!"
  exit 1
fi

echo "📦 Current generation: $GEN"

# Define paths
PIN="/nix/var/nix/profiles/system-stable"
LINK="/nix/var/nix/profiles/system-${GEN}-link"

# Check if already pinned
if [[ -L "$PIN" && "$(readlink -f "$PIN")" == "$(readlink -f "$LINK")" ]]; then
  echo "🔒 This generation is already pinned as 'system-stable'."
  exit 0
fi

# Create or update the symbolic link to pin this generation
sudo ln -sfn "$LINK" "$PIN"

echo "✅ Generation $GEN has been pinned as 'system-stable'!"
echo "   -> Saved under: $PIN"
echo
echo "🧱 This version will remain permanently until you manually unpin it."
