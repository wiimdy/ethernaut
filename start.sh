#!/bin/zsh
cd ../../ethernaut  # https://github.com/OpenZeppelin/ethernaut 다운 받은 경로로 변경
yarn network  > /dev/null 2>&1 & echo "y" | yarn deploy:contracts
yarn start:ethernaut