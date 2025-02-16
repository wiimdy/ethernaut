#!/bin/bash

# 원본 폴더와 대상 폴더 설정
SOURCE_FOLDER="./src/levels"      # 원본 폴더 (수정 가능)
DEST_FOLDER="./script"   # 대상 폴더 (수정 가능)

# 대상 폴더가 없으면 생성
mkdir -p "$DEST_FOLDER"

# 원본 폴더에서 .sol 파일 찾기
for file in "$SOURCE_FOLDER"/*.sol; do
    if [[ -f "$file" && ! "$file" =~ Factory ]]; then
        filename=$(basename -- "$file" .sol)  # 확장자 제거한 파일명
        
        new_filename="${filename}.s.sol"  # 새로운 파일명
        dest_file="$DEST_FOLDER/$new_filename"  # 대상 파일 경로
        
        # 상위 두 줄만 복사하여 새 파일 생성
        head -n 3 "$file" > "$dest_file"
        filenamel=$(echo "$filename" | tr '[:upper:]' '[:lower:]')
        content="
import {Script, console} from \"forge-std/Script.sol\";
import \"../src/levels/${filename}.sol\";

contract ${filename}Script is Script {
    address private target;

    function setUp() external {}

    function run() external {

        vm.startBroadcast();

        ${filename} ${filenamel}s = ${filename}(payable(target));

        vm.stopBroadcast();
    }
}"
        printf '%s\n' "$content" >> "$dest_file"
        echo "Created: $dest_file (Top 2 lines copied)"
    fi
done

echo "Done!"