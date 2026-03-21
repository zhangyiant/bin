# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal scripts/dotfiles repository containing shell utilities and configuration files for both PowerShell (Windows) and Bash (Linux/macOS) environments. The scripts primarily provide git shortcuts and navigation helpers.

## Repository Structure

- `alias.bash` — Bash aliases and shell functions (sourced in Bash environments)
- `profile.ps1` — PowerShell functions equivalent to the Bash aliases
- `Microsoft.PowerShell_profile.ps1` — PowerShell profile entry point; sets `$MyHome` and dots into `profile.ps1`
- `backup.bat` — Windows backup script

## Key Patterns

**Dual environment:** Every git shortcut exists in both Bash (`alias.bash`) and PowerShell (`profile.ps1`). When adding new shortcuts, add them to both files.

**Standalone scripts:**
- `backup.bat` — Windows backup script
