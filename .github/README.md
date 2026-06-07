# dotfiles

My personal dotfiles, managed as a **bare git repository** with `$HOME` as the work tree
(no symlinks, no extra tooling). Arch Linux + KDE Plasma 6, zsh, tmux, Alacritty, Neovim.

## How it works

The repo lives in `~/.cfg` (bare) and tracks files directly in `$HOME`. A shell alias
points git to the bare repo:

```sh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Day-to-day usage:

```sh
dotfiles status
dotfiles add ~/.config/foo/bar.conf
dotfiles commit -m "tweak foo"
dotfiles push
```

## Bootstrap on a new machine

```sh
# 1. Clone the bare repo
git clone --bare git@github.com:aakvik/dotfiles.git "$HOME/.cfg"

# 2. Define the alias (also add this line to your shell rc)
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# 3. Check out the tracked files into $HOME
#    (back up any conflicting files it reports first)
dotfiles checkout

# 4. Hide untracked files so `dotfiles status` stays clean
dotfiles config --local status.showUntrackedFiles no
```
