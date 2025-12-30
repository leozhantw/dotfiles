# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a dotfiles repository for macOS shell configuration. It manages configuration files for zsh (with oh-my-zsh), bash, vim, and git through symlinks.

## Commands

```bash
# First-time setup (installs oh-my-zsh, themes, plugins, and creates symlinks)
make init

# Re-create symlinks only (useful after pulling updates)
make link

# Sync with remote (pull then push)
make sync
```

## Structure

- `zshrc` - Main shell config using oh-my-zsh with powerlevel9k theme
- `bash_profile` - Bash config (auto-switches to zsh)
- `gitconfig` - Git aliases and settings
- `gitignore` - Global gitignore patterns
- `vimrc` - Vim settings (uses monokai colorscheme)
- `vim/colors/` - Vim colorscheme files

## Key Git Aliases (from gitconfig)

| Alias | Command |
|-------|---------|
| `fp` | `fetch -p` |
| `pl` / `plr` | `pull` / `pull --rebase` |
| `ps` / `psf` | `push` / `push --force-with-lease` |
| `co` | `checkout` |
| `br` | `branch` |
| `ci` / `cim` | `commit` / `commit -m` |
| `st` | `status` |
| `df` | `diff` |
| `rb` / `rbi` | `rebase` / `rebase -i` |
| `re` / `reh` | `reset` / `reset --hard` |

## Key Zsh Aliases (from zshrc)

- `ghclear` - Clean up merged branches
- `ghbr` - Interactive branch switching with fzf

## Dependencies

The `make init` command installs:
- oh-my-zsh
- powerlevel9k theme
- zsh-syntax-highlighting plugin
- zsh-autosuggestions plugin

## Notes

- Config sources `~/.customrc` for machine-specific settings
- Git is configured to use SSH for GitHub (`git@github.com:` instead of `https://github.com/`)
- Pull is configured to rebase by default
