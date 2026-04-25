# Personal Scripts and Dotfiles Repository

This repository contains personal shell utilities, configuration files, and scripts for both PowerShell (Windows) and Bash (Linux/macOS) environments. The primary focus is on providing git shortcuts and navigation helpers.

## Repository Structure

- **`alias.bash`** — Bash aliases and shell functions (sourced in Bash environments)
- **`profile.ps1`** — PowerShell functions equivalent to the Bash aliases
- **`Microsoft.PowerShell_profile.ps1`** — PowerShell profile entry point; sets `$MyHome` and dots into `profile.ps1`
- **`backup.bat`** — Windows backup script using robocopy
- **`AGENTS.md`** — Guidance for AI assistants working with this repository
- **`CLAUDE.md`** — Claude-specific instructions

## Installation and Setup

### Bash Setup (Linux/macOS)

Add the following to your `~/.bashrc` or `~/.bash_profile`:

```bash
# Source the aliases and functions
source /path/to/this/repo/alias.bash
```

### PowerShell Setup (Windows)

The `Microsoft.PowerShell_profile.ps1` file is designed to be placed in your PowerShell profile directory:

- Windows PowerShell 5.1: `$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
- PowerShell 7+: `$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`

The checked-in profile currently assumes this repository lives at `$HOME\git\bin` and dot-sources `profile.ps1` from that location. If your clone lives somewhere else, update the path in `Microsoft.PowerShell_profile.ps1`.

## Available Commands

### Git Shortcuts (Available in both Bash and PowerShell)

| Command | Description |
|---------|-------------|
| `ga` | `git add` |
| `gb` | `git branch -a` |
| `gd` | `git diff` |
| `gdc` | `git diff --cached` |
| `gs` | `git status` |
| `gsu` | `git submodule update --init --recursive` |
| `gc` | `git commit` |
| `gco` | `git checkout` |
| `gp` | `git push` |
| `gclean` | Destructive cleanup: stash, clean, prune remotes |
| `gacp` | Add all, commit with "update" message, and push |
| `gpu` | `git pull` |
| `gfo` | `git fetch origin` |
| `gl` | `git log --graph` |
| `gtl` | `git tag --list` |

### Navigation Functions

#### Bash Functions
- `enter-git` — Navigate to `$MY_HOME/git` directory
- `enter-bin` — Navigate to this repository (`$MY_HOME/git/bin`)
- `enter-rp` — Navigate to `$MY_HOME/git/RegisterPrinter`
- `enter-rpf` — Navigate to `$MY_HOME/git/register-printer-frontend`

#### PowerShell Functions
- `Enter-Git` — Navigate to `$MyHome\git` directory  
- `Enter-Bin` — Navigate to this repository (`$MyHome\git\bin`)
- `Enter-Rp` — Navigate to `$MyHome\git\RegisterPrinter`
- `Enter-Rpf` — Navigate to `$MyHome\git\register-printer-frontend`
- `Enter-EmacsD` — Navigate to Emacs configuration directory
- `Enter-Tmp` — Navigate to `C:\tmp`

### Other Aliases

#### Bash Only
- `e` — Start Emacs via `start_emacs.bash`
- `ee` — `emacsclient -nw`
- `t` — `tmux attach`

## Key Design Patterns

### Dual Environment Support
Every git shortcut exists in both Bash (`alias.bash`) and PowerShell (`profile.ps1`). When adding new shortcuts, they should be added to both files to maintain consistency across environments.

### Environment Variable Handling
- **Bash**: Uses `MY_HOME` environment variable (falls back to `$HOME` if not set)
- **PowerShell**: Uses `$env:MY_HOME` when present, otherwise falls back to `$HOME`

### Standalone Scripts
- `backup.bat` — Windows backup script using robocopy to copy Documents, Pictures, and Videos to a network location

## Development Guidelines

When working with this repository:

1. **Maintain parity**: Ensure equivalent functionality exists in both Bash and PowerShell versions
2. **Follow naming conventions**: 
   - Bash: lowercase with hyphens (`to-git`)
   - PowerShell: `Enter-*` functions (`Enter-Git`)
3. **Update documentation**: Keep this README and AGENTS.md current when adding new functionality
4. **Test both environments**: Verify changes work in both Bash and PowerShell

## Safety Notes

- `gclean` runs `git clean -dxff`, which removes untracked files and directories. Review the current working tree before using it.
- `backup.bat` contains machine-specific Windows and NAS paths. Update them before using the script on another machine.

## Smoke Tests

Run these lightweight checks after changing the shell helpers.

### Bash

```bash
source /path/to/this/repo/alias.bash
type to-bin
type gclean
to-bin
```

### PowerShell

```powershell
. $PROFILE
Get-Command Enter-Bin
Get-Command gclean
Enter-Bin
```

## Automated Validation

GitHub Actions runs `.github/workflows/validate.yml` to:
- lint `alias.bash` with `shellcheck`
- parse `profile.ps1` and `Microsoft.PowerShell_profile.ps1` for PowerShell syntax errors

## Backup Script

The `backup.bat` script uses `robocopy` with machine-specific paths:
- `C:\Users\zhang\Documents\MyDocuments` → `\\192.168.1.238\nas\Documents`
- `C:\Users\zhang\Pictures\Pictures` → `\\192.168.1.238\nas\Pictures`
- `C:\Users\zhang\Videos\Videos` → `\\192.168.1.238\nas\Videos`

You can override these defaults with `BACKUP_SOURCE_DOCUMENTS`, `BACKUP_SOURCE_PICTURES`, `BACKUP_SOURCE_VIDEOS`, and `BACKUP_DEST_ROOT` before running the script on another machine.

## For AI Assistants

See `AGENTS.md` for specific guidance when AI assistants are working with this repository. The file provides context about the repository structure and key patterns to follow.