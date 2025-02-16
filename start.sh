#!/bin/zsh
cd ../../ethernaut
yarn network  > /dev/null 2>&1 & echo "y" | yarn deploy:contracts
yarn start:ethernaut