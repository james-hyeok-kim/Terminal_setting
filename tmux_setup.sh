#!/usr/bin/env bash
# Install .tmux.conf

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.terminal_setting_backup_$(date +%Y%m%d_%H%M%S)"

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
print_ok()   { echo -e "${GREEN}[OK]${NC}  $1"; }
print_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }

echo ""
echo "=== tmux setup ==="
echo ""

# Backup existing .tmux.conf
if [ -f "$HOME/.tmux.conf" ]; then
    mkdir -p "$BACKUP_DIR"
    cp "$HOME/.tmux.conf" "$BACKUP_DIR/.tmux.conf"
    print_warn "Backed up existing .tmux.conf -> $BACKUP_DIR/"
fi

cp "$SCRIPT_DIR/.tmux_conf" "$HOME/.tmux.conf"
print_ok "Installed .tmux.conf"

echo ""
print_ok "Done! Run: tmux source-file ~/.tmux.conf  (or restart tmux)"
echo ""
