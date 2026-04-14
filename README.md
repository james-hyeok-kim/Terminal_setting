# Terminal Setting

Personal terminal config files (`.vimrc`, `.bashrc`) with a setup script for quick environment setup on any machine.

## Quick Start

```bash
git clone https://github.com/james-hyeok-kim/Terminal_setting.git
cd Terminal_setting
chmod +x setup.sh
./setup.sh
```

## Options

| Option | Description |
|--------|-------------|
| `./setup.sh` or `./setup.sh -a` | Install all (`.vimrc` + `.bashrc`) |
| `./setup.sh -v` | Install `.vimrc` only |
| `./setup.sh -b` | Install `.bashrc` only |
| `./setup.sh -h` | Show help |

- Existing files are **automatically backed up** before overwriting
- Backup location: `~/.terminal_setting_backup_YYYYMMDD_HHMMSS/`

## Post-setup (vim plugins)

Vundle is auto-installed by `setup.sh`. Then inside vim run:

```
:PluginInstall
```

## Files

| File | Description |
|------|-------------|
| `.vimrc` | Vim config — Vundle, NERDTree, syntax, indent, search |
| `.bashrc` | Bash config — aliases, git shortcuts, history, nvm, venv |
| `setup.sh` | Setup script |
