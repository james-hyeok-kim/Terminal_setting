#!/usr/bin/env bash
# Install everything: .vimrc + .bashrc + vim plugins

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "============================================"
echo "  Terminal Setting — Full Setup"
echo "============================================"

bash "$SCRIPT_DIR/vimrc_setup.sh"
bash "$SCRIPT_DIR/bashrc_setup.sh"
bash "$SCRIPT_DIR/vim_plugins_setup.sh"

echo ""
echo "============================================"
echo "  All done! Restart terminal or run:"
echo "  source ~/.bashrc"
echo "============================================"
echo ""
