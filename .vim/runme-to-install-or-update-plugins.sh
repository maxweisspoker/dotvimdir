#!/bin/bash
# Do not move this script, it must stay in the current directory!
echo 'Re-installing Vundle'

#######################
mv $(pwd)/bundle/YouCompleteMe $(pwd)
#######################

rm -rf $(pwd)/bundle/*
git clone https://github.com/VundleVim/Vundle.vim.git $(pwd)/bundle/Vundle.vim > /dev/null 2>&1
echo 'Finished'
echo 'Re-installing Plugins'
vim -i NONE -c PluginInstall -c quitall > /dev/null 2>&1
echo 'Finished'
echo 'Updating Plugins'
vim -i NONE -c VundleUpdate -c quitall > /dev/null 2>&1
echo 'Finished'

#########################3
#echo 'Remaking YouCompleteMe objects'
#cd $(pwd)/bundle/YouCompleteMe
#./install.py --clang-completer > /dev/null 2>&1
#echo 'Finished'
mv $(pwd)/YouCompleteMe $(pwd)/bundle/YouCompleteMe
#############################3

echo ''
echo 'Script completed.'

