#!/usr/bin/env bash
INSTALLDIR=$PWD

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Backup up current files.$(tput sgr 0)"
echo "---------------------------------------------------------"

# Backup files that are provided by the Jarvis into a ~/$INSTALLDIR-backup directory
BACKUP_DIR=$INSTALLDIR/backup

set -e # Exit immediately if a command exits with a non-zero status.

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Creating backup directory at $BACKUP_DIR.$(tput sgr 0)"
echo "---------------------------------------------------------"
if [[ -d $BACKUP_DIR ]]; then
    rm -rf $BACKUP_DIR
fi
mkdir -p $BACKUP_DIR

files=(
  "$HOME/.config/nvim"
  "$HOME/.config/alacritty"
  "$HOME/.zshrc"
  "$HOME/.tmux.conf"
  "$HOME/.tmux.conf.local"
)
for filename in "${files[@]}"; do
    if [[ -d $filename ]]; then
        if [ -z "$(ls -A $filename)" ]; then
            echo "$filename is Empty"
        else
            echo "---------------------------------------------------------"
            echo "$(tput setaf 2)JARVIS: Backing up directory $filename.$(tput sgr 0)"
            echo "---------------------------------------------------------"
            name=$(basename $filename)
            target="$BACKUP_DIR/$name/"
            mkdir -p $target
            mv $filename/* $target
        fi
    elif [[ -f $filename ]]; then
      echo "---------------------------------------------------------"
      echo "$(tput setaf 2)JARVIS: Backing up file $filename.$(tput sgr 0)"
      echo "---------------------------------------------------------"
      mv $filename $BACKUP_DIR
    else
      echo "---------------------------------------------------------"
      echo -e "$(tput setaf 3)JARVIS: $filename does not exist at this location or is a symlink.$(tput sgr 0)"
      echo "---------------------------------------------------------"
    fi
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Backup completed.$(tput sgr 0)"
echo "---------------------------------------------------------"
