#!/usr/bin/env bash
#
# install.sh — symlink dotfiles into $HOME
#
# Run manually:    ./install.sh
# Codespaces runs this automatically when "Automatically install dotfiles"
# is enabled in https://github.com/settings/codespaces

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from: $DOTFILES_DIR"

# Files to symlink into $HOME.
# Format: "<repo-filename>:<dest-filename-in-$HOME>"
# Storing without the leading dot in the repo keeps things visible in
# directory listings; install.sh adds the dot when it links into $HOME.
FILES=(
	"gitconfig:.gitconfig"
)

link_file() {
	local src_name="${1%%:*}"
	local dest_name="${1##*:}"
	local src="$DOTFILES_DIR/$src_name"
	local dest="$HOME/$dest_name"

	if [ ! -e "$src" ]; then
		echo "  skip:    $src_name (not found in repo)"
		return
	fi

	# If $dest exists and isn't already a symlink we can replace, back it up.
	if [ -L "$dest" ]; then
		rm "$dest"
	elif [ -e "$dest" ]; then
		echo "  backup:  $dest -> $dest.backup"
		mv "$dest" "$dest.backup"
	fi

	ln -s "$src" "$dest"
	echo "  linked:  $src_name -> $dest"
}

for entry in "${FILES[@]}"; do
	link_file "$entry"
done

echo "Done."
