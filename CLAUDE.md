# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal scripts/dotfiles repository containing shell utilities and configuration files for both PowerShell (Windows) and Bash (Linux/macOS) environments. The scripts primarily provide git shortcuts and navigation helpers.

## Repository Structure

- `alias.bash` — Bash aliases and shell functions (sourced in Bash environments)
- `profile.ps1` — PowerShell functions equivalent to the Bash aliases
- `Microsoft.PowerShell_profile.ps1` — PowerShell profile entry point; sets `$MyHome` and dots into `profile.ps1`
- `*.ps1` — Individual PowerShell utility scripts
- `*.bat` — Windows batch scripts

## Key Patterns

**Dual environment:** Every git shortcut exists in both Bash (`alias.bash`) and PowerShell (`profile.ps1`). When adding new shortcuts, add them to both files.

**Standalone scripts:**
- `proxy.ps1` / `unproxy.ps1` — Set/unset git HTTP proxy (`localhost:9000`)
- `gacp.ps1` — Standalone add/commit/push script
- `py_rp.ps1` — Activates a Python virtual environment at `C:\py37_rp`
