#!/usr/bin/env bash
# ============================================================
#  Terminal Setting Setup Script
#  Usage: ./setup.sh [options]
#
#  Options:
#    -a, --all       Copy all config files (default)
#    -v, --vim       Copy only .vimrc
#    -b, --bash      Copy only .bashrc
#    -h, --help      Show this help message
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.terminal_setting_backup_$(date +%Y%m%d_%H%M%S)"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

print_ok()   { echo -e "${GREEN}[OK]${NC}  $1"; }
print_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
print_err()  { echo -e "${RED}[ERR]${NC}  $1"; }

backup_if_exists() {
    local file="$1"
    if [ -f "$file" ]; then
        mkdir -p "$BACKUP_DIR"
        cp "$file" "$BACKUP_DIR/"
        print_warn "Backed up existing $(basename "$file") -> $BACKUP_DIR/"
    fi
}

install_vimrc() {
    backup_if_exists "$HOME/.vimrc"
    cp "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
    print_ok "Installed .vimrc"

    # Install Vundle if not present
    if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
        print_warn "Vundle not found. Installing..."
        git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
        print_ok "Vundle installed"
        print_warn "Run :PluginInstall inside vim to finish plugin setup"
    fi
}

install_bashrc() {
    backup_if_exists "$HOME/.bashrc"
    cp "$SCRIPT_DIR/.bashrc" "$HOME/.bashrc"
    print_ok "Installed .bashrc"
    print_warn "Run: source ~/.bashrc  (or restart terminal)"
}

usage() {
    echo "Usage: $0 [options]"
    echo ""
    echo "  -a, --all     Copy all config files (default)"
    echo "  -v, --vim     Copy only .vimrc"
    echo "  -b, --bash    Copy only .bashrc"
    echo "  -h, --help    Show this help"
}

# Default: install all
DO_VIM=true
DO_BASH=true

# Parse args
if [ $# -gt 0 ]; then
    DO_VIM=false
    DO_BASH=false
    for arg in "$@"; do
        case $arg in
            -a|--all)   DO_VIM=true;  DO_BASH=true  ;;
            -v|--vim)   DO_VIM=true                  ;;
            -b|--bash)  DO_BASH=true                 ;;
            -h|--help)  usage; exit 0                ;;
            *)  print_err "Unknown option: $arg"; usage; exit 1 ;;
        esac
    done
fi

echo ""
echo "============================================"
echo "  Terminal Setting Setup"
echo "============================================"
echo ""

$DO_VIM  && install_vimrc
$DO_BASH && install_bashrc

echo ""
print_ok "Done!"
[ -d "$BACKUP_DIR" ] && echo -e "   Backups saved in: $BACKUP_DIR"
echo ""
