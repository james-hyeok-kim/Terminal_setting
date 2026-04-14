#!/usr/bin/env bash
# Install vim plugins via Vundle (runs :PluginInstall non-interactively)

set -e

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
print_ok()   { echo -e "${GREEN}[OK]${NC}  $1"; }
print_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
print_err()  { echo -e "${RED}[ERR]${NC}  $1"; }

echo ""
echo "=== vim plugins setup ==="
echo ""

# Check Vundle is installed
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    print_err "Vundle not found. Run ./vimrc_setup.sh first."
    exit 1
fi

# Check .vimrc exists
if [ ! -f "$HOME/.vimrc" ]; then
    print_err ".vimrc not found. Run ./vimrc_setup.sh first."
    exit 1
fi

print_warn "Installing vim plugins via Vundle..."
vim +PluginInstall +qall

print_ok "All plugins installed:"
echo "   - tpope/vim-fugitive"
echo "   - preservim/nerdtree"
echo ""
print_ok "Done!"
echo ""
