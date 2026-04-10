# AGENTS.md

This file provides guidance to coding assistants when working with code in this repository.

## Overview

This repository contains personal shell utilities, configuration files, AI assistant guidance, and documentation for both PowerShell (Windows) and Bash (Linux/macOS) environments. The scripts primarily provide git shortcuts and navigation helpers.

## Repository Structure

- `alias.bash` — Bash aliases and shell functions (sourced in Bash environments)
- `profile.ps1` — PowerShell functions equivalent to the Bash aliases
- `Microsoft.PowerShell_profile.ps1` — PowerShell profile entry point; sets `$MyHome` and dots into `profile.ps1`
- `backup.bat` — Windows backup script
- `AGENTS.md` — Guidance for AI assistants working with this repository
- `CLAUDE.md` — Reference to AGENTS.md for Claude-specific instructions
- `README.md` — Repository documentation and setup instructions
- `.github/workflows/validate.yml` — CI checks for Bash and PowerShell script validation
- `.gitignore` — Minimal ignore rules for editor backup files

## Key Patterns

**Dual environment:** Every git shortcut exists in both Bash (`alias.bash`) and PowerShell (`profile.ps1`). When adding new shortcuts, add them to both files and keep behavior aligned across shells.

**Navigation naming:** Bash navigation helpers use `to-*`; PowerShell uses `Enter-*`.

**Environment handling:** Bash resolves paths from `MY_HOME` and falls back to `$HOME`. The PowerShell profile entry point uses `$env:MY_HOME` when set, otherwise `$HOME`, and dot-sources `profile.ps1` from `$MyHome\git\bin`.

**Standalone scripts:**
- `backup.bat` — Windows backup script with machine-specific default paths; prefer overriding them with `BACKUP_SOURCE_DOCUMENTS`, `BACKUP_SOURCE_PICTURES`, `BACKUP_SOURCE_VIDEOS`, and `BACKUP_DEST_ROOT` instead of editing the tracked file

**Validation:**
- CI runs `shellcheck alias.bash`
- CI parses `profile.ps1` and `Microsoft.PowerShell_profile.ps1` for PowerShell syntax errors
