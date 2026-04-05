# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Communication

**AIとのコミュニケーションは日本語で行う** (Communicate with AI in Japanese)

OpenSpec で生成するドキュメント（Proposal, Tasks, Specs など）も日本語で記述する。

## Repository Overview

This is a dotfiles repository managing shell configurations, tool setups, and initialization scripts for Windows, macOS, Linux, and WSL environments. There is no build system or automated test suite.

## Validation

Check whether dotfiles are correctly installed (symlinked to `$HOME`):
```bash
./bin/chkdotfiles
```

Check for updates to dotfiles and related repos:
```bash
./bin/chkupdate
```

## Deployment

Deploy dotfiles to the home directory via symlinks (`.example` files are copied, not symlinked):
```bash
cd dots && ./_setup.sh      # Unix/Linux/macOS
cd dots && ./_setup.bat     # Windows
```

On Linux/WSL, `_setup.sh` appends a loader snippet to `~/.bashrc` if it is not already a symlink.  
On WSL, additionally copy `dots/wsl/etc/wsl.conf` to `/etc/wsl.conf` manually.

## Architecture

### Shell loading chain

```
~/.bashrc (or .bash_profile on macOS)
  └── dots/.bashrc_basis          # entry point; loads all shell configs
        ├── shell/{bash_prompt,exports,functions,alias,options,completion}
        ├── dots/linux/.bashrc_linux   (Linux only)
        ├── dots/wsl/.bashrc_wsl       (WSL only, after linux)
        ├── dots/macos/.bashrc_macos   (macOS only)
        └── ~/.bashrc_local            (machine-local overrides, not tracked)
```

`dots/.bashrc_basis` also initializes tools conditionally by checking with `hash <tool>` or `command -v`: fzf, direnv, sheldon, Worktrunk (`wt`), mise, fnm, SDKMAN.

### Platform detection pattern

```bash
if [ "$(uname)" == 'Linux' ]; then
  if [[ "$(uname -r)" == *microsoft* ]]; then
    # WSL
  fi
elif [ "$(uname)" == 'Darwin' ]; then
  # macOS
fi
```

### Directory conventions

| Path | Purpose |
|------|---------|
| `dots/` | Dotfiles deployed to `$HOME` via symlink |
| `dots/{linux,macos,win,wsl}/` | Platform-specific dotfiles |
| `shell/` | Shell fragments sourced by `.bashrc_basis` (not symlinked to `$HOME`) |
| `bin/` | Standalone executable scripts |
| `init/` | One-time system initialization scripts and package lists |
| `init/macos/` | Homebrew `Brewfile`, `BrewCaskfile`, macOS defaults |
| `init/win/` | `winget` import JSON files, Chocolatey config, registry scripts |
| `init/wsl/` | APT package install scripts |
| `etc/` | Config files for specific apps (Mery, Raycast) |
| `doc/` | Setup and configuration documentation (Markdown) |
| `openspec/` | OpenSpec change-tracking artifacts |

### Local overrides (not tracked by git)

- `~/.bashrc_local` — machine-specific shell settings (template: `dots/.bashrc_local.example`)
- `~/.gitconfig_local` — machine-specific git settings (included from `dots/.gitconfig`)

## Code Style (Shell Scripts)

- Shebang: `#!/usr/bin/env bash`
- Error handling: `set -euo pipefail` where appropriate; use `|| exit` after `cd`
- Quote variables: `"$VAR"` not `$VAR`
- Command substitution: `$(command)` not backticks
- Local variables in functions: use `local`
- Prefer `printf` over `echo` for portability
- Check command availability: `hash <cmd> 2>/dev/null` or `command -v <cmd>`
- Cross-platform scripts: provide both `.sh` and `.bat` versions when needed

### Naming conventions

- Shell functions and variables: `snake_case`
- Constants/environment variables: `SCREAMING_SNAKE_CASE`
- Executables: `snake_case` or `kebab-case`
- Hidden config files: leading dot (e.g., `.bashrc`)

## OpenSpec Workflow

Changes are tracked using OpenSpec (`openspec/config.yaml`). Skills live under `.claude/skills/`; commands under `.claude/commands/opsx/`.

| Command | Purpose |
|---------|---------|
| `/opsx:new` | Start a new change |
| `/opsx:continue` | Create the next artifact |
| `/opsx:ff` | Fast-forward: create all artifacts at once |
| `/opsx:apply` | Implement tasks |
| `/opsx:verify` | Verify implementation against artifacts |
| `/opsx:archive` | Archive a completed change |
| `/opsx:sync` | Sync delta specs to main specs |
| `/opsx:explore` | Explore/think mode (no code changes) |
| `/opsx:bulk-archive` | Archive multiple changes at once |
| `/opsx:onboard` | Guided walkthrough of the full workflow |

The same skills are also available for OpenCode (`.opencode/skills/`) and Gemini (`.gemini/skills/`).

## Git

- Always confirm with the user before committing.
- Commit message template: `~/.gitmessage.txt` (from `dots/.gitmessage.txt`)
- Default branch: `main`
