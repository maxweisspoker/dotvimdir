#!/bin/bash
vim -c PluginInstall -c quitall
sleep 2
vim -c VundleUpdate -c quitall
sleep 2
cd $(pwd)/bundle/YouCompleteMe
./install.py --clang-completer
