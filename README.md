## Foundry


사용법.

### 1. makeScript.sh
- makeScript.sh에 실행 권한을 준 후 (chmod 755 makeScript.sh) 실행을 하면 script 폴더에 script 파일들이 나온다.
- script 파일 안에 원하는 내용이 있을 경우 content안에 추가를 한다.

### 2. start.sh 
- 실행권한을 똑같이 준 후 (chmod 755 start.sh) 쉘 스크립트 내 이더넛 깃헙 주소를 환경에 맞추어 설정하고 실행하면 
- yarn network, deploy, start가 실행된다.

### 3. wallet 추가 방법
https://piatoss3612.tistory.com/139 
참조

### 4. 자주 사용하는 명령어
forge script --account local --rpc-url $RPC_URL --broadcast script/<문제 이름>.s.sol:<컨트랙트 이름>

예시

forge script --account local --rpc-url $RPC_URL --broadcast script/Fallback.s.sol:FallbackScript

### 5. 알면 좋은거
https://book.getfoundry.sh/
