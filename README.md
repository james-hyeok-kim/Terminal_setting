# Terminal Setting

Personal terminal config files (`.vimrc`, `.bashrc`) with setup scripts for quick environment setup on any machine.

## Quick Start

```bash
git clone https://github.com/james-hyeok-kim/Terminal_setting.git
cd Terminal_setting
chmod +x *.sh
./setup_all.sh
```

## Scripts

| Script | Description |
|--------|-------------|
| `setup_all.sh` | Install everything (vimrc + bashrc + vim plugins) |
| `vimrc_setup.sh` | Install `.vimrc` + Vundle only |
| `bashrc_setup.sh` | Install `.bashrc` only |
| `vim_plugins_setup.sh` | Install vim plugins via Vundle (run after `vimrc_setup.sh`) |

### Individual setup

```bash
./vimrc_setup.sh          # .vimrc + Vundle
./vim_plugins_setup.sh    # NERDTree, vim-fugitive, ...
./bashrc_setup.sh         # .bashrc
```

- Existing files are **automatically backed up** before overwriting
- Backup location: `~/.terminal_setting_backup_YYYYMMDD_HHMMSS/`

## Files

| File | Description |
|------|-------------|
| `.vimrc` | Vim config — Vundle, NERDTree, syntax, indent, search |
| `.bashrc` | Bash config — aliases, git shortcuts, history, nvm, venv |
