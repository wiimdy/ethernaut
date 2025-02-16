#!/bin/zsh
cd ../../ethernaut  # https://github.com/OpenZeppelin/ethernaut 이 있는 경로로 이동
yarn network  > /dev/null 2>&1 & echo "y" | yarn deploy:contracts
yarn start:ethernaut