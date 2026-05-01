# dotfiles

Personal dotfiles. Currently just a `.gitconfig` with sensible defaults and a handful of aliases.

## Install locally

```bash
git clone https://github.com/hazmatzo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The installer symlinks files into `$HOME`. Anything already there is moved to `<file>.backup` first. Files are stored in this repo without leading dots (e.g. `gitconfig` rather than `.gitconfig`) so they show up in normal `ls` output; `install.sh` adds the dot when linking.

## Use with GitHub Codespaces

1. Push this repo to `hazmatzo/dotfiles` (it can be public or private).
2. Go to <https://github.com/settings/codespaces>.
3. Under **Dotfiles**, check **Automatically install dotfiles** and select `hazmatzo/dotfiles`.

Every new codespace will clone the repo and run `install.sh` automatically.

## Git aliases

| alias | command |
| --- | --- |
| `git s` | `git status -sb` |
| `git lg` | pretty graph log |
| `git new <name>` | `git switch -c <name>` |
| `git cm "msg"` | `git commit -m "msg"` |
| `git amend` | `git commit --amend --no-edit` |
| `git p` | `git push` |
| `git pf` / `git pushf` | `git push --force-with-lease` |
| `git sync` | `git pull --rebase && git push` |
| `git update [base]` | fetch `origin/<base>` (default `main`) and rebase the current branch onto it |
| `git undo` | `git reset --soft HEAD~1` |
