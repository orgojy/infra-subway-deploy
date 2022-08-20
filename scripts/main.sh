#!/bin/bash

set -e

## 변수 설정
SHELL_SCRIPT_PATH=$(dirname "$0")
BRANCH=$1
PROFILE=$2

# 색 관련 변수
txtrst='\033[1;37m' # White
txtred='\033[1;31m' # Red
txtylw='\033[1;33m' # Yellow
txtpur='\033[1;35m' # Purple
txtgrn='\033[1;32m' # Green
txtgra='\033[1;30m' # Gray

## 조건 설정
if [[ $# -ne 2 ]]; then
  echo -e "${txtylw}=======================================${txtrst}"
  echo -e "${txtgrn} 사용법 : $0 {branch-name} {local | prod}${txtrst}"
  echo -e "${txtylw}=======================================${txtrst}"
  exit
fi

add_line_crlf() {
  echo ""
}

pull_branch() {
  echo -e "${txtylw}=======================================${txtrst}"
  echo -e "${txtgrn} '$BRANCH' branch 를 pull 합니다.. ${txtrst}"
  echo -e "${txtylw}=======================================${txtrst}"

  git pull origin "$BRANCH"

  add_line_crlf
}

build_application() {
  echo -e "${txtylw}=======================================${txtrst}"
  echo -e "${txtgrn} '빌드를 시작합니다.. ${txtrst}"
  echo -e "${txtylw}=======================================${txtrst}"

  ./gradlew clean build

  add_line_crlf
}

## 저장소 pull
pull_branch

## Build application by Gradle
build_application
