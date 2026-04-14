#!/usr/bin/env bash
# Install .vimrc and Vundle plugin manager

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.terminal_setting_backup_$(date +%Y%m%d_%H%M%S)"

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
print_ok()   { echo -e "${GREEN}[OK]${NC}  $1"; }
print_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }

echo ""
echo "=== vimrc setup ==="
echo ""

# Backup existing .vimrc
if [ -f "$HOME/.vimrc" ]; then
    mkdir -p "$BACKUP_DIR"
    cp "$HOME/.vimrc" "$BACKUP_DIR/.vimrc"
    print_warn "Backed up existing .vimrc -> $BACKUP_DIR/"
fi

cp "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
print_ok "Installed .vimrc"

# Install Vundle if not present
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    print_warn "Vundle not found. Installing..."
    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
    print_ok "Vundle installed"
fi

echo ""
print_ok "Done! Run ./vim_plugins_setup.sh to install vim plugins."
echo ""
