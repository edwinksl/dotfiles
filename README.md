This is a repository for managing dotfiles by using [`stow`](https://www.gnu.org/software/stow/). Read more about how to do this at http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html.

# Instructions

## Install packages

1. `cd`
2. `git clone https://github.com/edwinksl/dotfiles.git`
3. `cd dotfiles/`
4. List directory structure: `tree -a -I ".git"`
5. Copy symlinks for all packages: `stow --adopt */`

## Delete packages

1. Delete symlinks for all packages: `stow -D */`

## Restow packages

1. Restow all packages: `stow -R */`

## Maintain targets

1. Check `~` for bogus symlinks: `chkstow ~`

# Resources
1. `stow` documentation: https://www.gnu.org/software/stow/manual/stow.html
