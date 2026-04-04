# AGENTS.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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

## Key Patterns

**Dual environment:** Every git shortcut exists in both Bash (`alias.bash`) and PowerShell (`profile.ps1`). When adding new shortcuts, add them to both files and keep behavior aligned across shells.

**Navigation naming:** Bash navigation helpers use `to-*`; PowerShell uses `Enter-*`.

**Environment handling:** Bash resolves paths from `MY_HOME` and falls back to `$HOME`. The PowerShell profile entry point assumes the repository lives at `$HOME\git\bin` unless its dot-sourced path is edited.

**Standalone scripts:**
- `backup.bat` — Windows backup script with machine-specific paths that should be treated as local configuration
