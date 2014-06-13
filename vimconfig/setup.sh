#!/bin/bash
cp -r ~/infoBackup/vimconfig/.vim ~/
cp  ~/infoBackup/vimconfig/.vimrc ~/
cat ~/infoBackup/vimconfig/myAlias >> ~/.bashrc
sudo cp ~/infoBackup/vimconfig/tags /usr/include/
