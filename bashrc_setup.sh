#!/usr/bin/env bash
# Install .bashrc

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.terminal_setting_backup_$(date +%Y%m%d_%H%M%S)"

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
print_ok()   { echo -e "${GREEN}[OK]${NC}  $1"; }
print_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }

echo ""
echo "=== bashrc setup ==="
echo ""

# Backup existing files
if [ -f "$HOME/.bashrc" ]; then
    mkdir -p "$BACKUP_DIR"
    cp "$HOME/.bashrc" "$BACKUP_DIR/.bashrc"
    print_warn "Backed up existing .bashrc -> $BACKUP_DIR/"
fi

if [ -f "$HOME/.bash_profile" ]; then
    mkdir -p "$BACKUP_DIR"
    cp "$HOME/.bash_profile" "$BACKUP_DIR/.bash_profile"
    print_warn "Backed up existing .bash_profile -> $BACKUP_DIR/"
fi

cp "$SCRIPT_DIR/.bashrc" "$HOME/.bashrc"
print_ok "Installed .bashrc"

cp "$SCRIPT_DIR/.bash_profile" "$HOME/.bash_profile"
print_ok "Installed .bash_profile"

echo ""
print_ok "Done! Run: source ~/.bashrc  (or restart terminal)"
echo ""
