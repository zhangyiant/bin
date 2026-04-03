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

The `Microsoft.PowerShell_profile.ps1` file is designed to be placed in your PowerShell profile directory. Typically, this is:

```
$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

Or for PowerShell Core:
```
$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

The profile will automatically set `$MyHome` and source the main profile script.

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
| `gcl` | `git clone` |
| `gco` | `git checkout` |
| `gp` | `git push` |
| `gclean` | Clean workspace: stash, clean, prune remotes |
| `gacp` | Add all, commit with "update" message, and push |
| `gpu` | `git pull` |
| `gfo` | `git fetch origin` |
| `gl` | `git log --graph` |
| `gtl` | `git tag --list` |

### Navigation Functions

#### Bash Functions
- `to-git` — Navigate to `$MY_HOME/git` directory
- `to-bin` — Navigate to this repository (`$MY_HOME/git/bin`)
- `to-rp` — Navigate to `$MY_HOME/git/RegisterPrinter`
- `to-rpf` — Navigate to `$MY_HOME/git/register-printer-frontend`

#### PowerShell Functions
- `To-Git` — Navigate to `$MyHome\git` directory  
- `To-Bin` — Navigate to this repository (`$MyHome\git\bin`)
- `To-Rp` — Navigate to `$MyHome\git\RegisterPrinter`
- `To-Rpf` — Navigate to `$MyHome\git\register-printer-frontend`
- `to_emacs_d` — Navigate to Emacs configuration directory
- `To-Tmp` — Navigate to `C:\tmp`

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
- **PowerShell**: Uses `$MyHome` variable (set to `$HOME` by default)

### Standalone Scripts
- `backup.bat` — Windows backup script using robocopy to copy Documents, Pictures, and Videos to a network location

## Development Guidelines

When working with this repository:

1. **Maintain parity**: Ensure equivalent functionality exists in both Bash and PowerShell versions
2. **Follow naming conventions**: 
   - Bash: lowercase with hyphens (`to-git`)
   - PowerShell: PascalCase (`To-Git`)
3. **Update documentation**: Keep this README and AGENTS.md current when adding new functionality
4. **Test both environments**: Verify changes work in both Bash and PowerShell

## Backup Script

The `backup.bat` script uses `robocopy` to backup user data to a network location:
- Documents → `\\192.168.1.238\nas\Documents`
- Pictures → `\\192.168.1.238\nas\Pictures`  
- Videos → `\\192.168.1.238\nas\Videos`

## For AI Assistants

See `AGENTS.md` for specific guidance when AI assistants are working with this repository. The file provides context about the repository structure and key patterns to follow.