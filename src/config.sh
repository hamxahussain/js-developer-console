# !/bin/bash

# -------------------- Importing files --------------------
source jsConsoler_style.sh
source jsConsoler_pkg.sh

# -------------------- Function & Logics --------------------
CURRENT_DIR=$PWD
# if (($OSTYPE == "win32")); then
#   reg add HKEY_CURRENT_USER\Console /v VirtualTerminalLevel /t REG_DWORD /d 0x00000001 /f
# fi
function f_isCommandExist {
  if [[ $($1 --help) ]]; then
    echo 1
  else
    echo 0
  fi
}

function f_userMsg {
  echo -e "$1 $RESET$GREEN_COLOR $2"
}

function f_line {
  echo -e "$YELLOW_COLOR=====================================================================$RESET"
}

function f_tageMsg {
  if [[ "$3" == "disabled" ]]; then
    echo -e "    $RESET$DISABLED_COLOR[$DISABLED_COLOR$BOLD$1$RESET$DISABLED_COLOR]:  $RESET$2"
  else
    echo -e "   $RESET$GREEN_COLOR [$GREEN_COLOR$BOLD$1$RESET$GREEN_COLOR]:  $RESET$2"
  fi
}

# function f_tageMsg2 {
#   if (((($1 - 1) % 2) == 0)); then
#     echo -en "   $RESET$GREEN_COLOR [$GREEN_COLOR$BOLD$1$RESET$GREEN_COLOR]: $RESET$2\t\t\t\t\t"
#   else
#     echo -e "   $RESET$GREEN_COLOR [$GREEN_COLOR$BOLD$1$RESET$GREEN_COLOR]: $RESET$2"
#   fi
# }

function f_menu {
  f_line
  echo
  f_tageMsg " 1" "$HTML_TAG"
  echo
  f_tageMsg " 2" "$HTML_TAG + $HOSTING_FIREBASE_TAG" "disabled"
  echo
  f_tageMsg " 3" "$REACT_TAG"
  echo
  f_tageMsg " 4" "$REACT_TAG + $FULL_FIREBASE_TAG"
  echo
  f_tageMsg " 5" "$REACT_TAG + $HOSTING_FIREBASE_TAG"
  echo
  f_tageMsg " 6" "$REACT_TAG + $FUNCTION_FIREBASE_TAG"
  echo
  f_tageMsg " 7" "$REACT_TAG + $EMULATORS_FIREBASE_TAG"
  echo
  f_tageMsg " 8" "$REACT_TAG + $FUNCTION_EMULATORS_HOSTING_FIREBASE_TAG"
  echo
  f_tageMsg " 9" "$REACT_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg " 10" "$REACT_TAG + $FULL_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 11 "$REACT_TAG + $HOSTING_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 12 "$REACT_TAG + $FUNCTION_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 13 "$REACT_TAG + $EMULATORS_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 14 "$REACT_TAG + $FUNCTION_EMULATORS_HOSTING_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 15 "$REACT_NATIVE_TAG" "disabled"
  echo
  f_tageMsg 16 "$REACT_NATIVE_TAG + $FULL_FIREBASE_TAG" "disabled"
  echo
  f_tageMsg 17 "$REACT_NATIVE_TAG + $FUNCTION_FIREBASE_TAG" "disabled"
  echo
  f_tageMsg 18 "$REACT_NATIVE_TAG + $EMULATORS_FIREBASE_TAG" "disabled"
  echo
  f_tageMsg 19 "$REACT_NATIVE_TAG + $FUNCTION_EMULATORS_FIREBASE_TAG" "disabled"
  echo
  f_tageMsg 20 "$REACT_NATIVE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 21 "$REACT_NATIVE_TAG + $FULL_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 22 "$REACT_NATIVE_TAG + $FUNCTION_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 23 "$REACT_NATIVE_TAG + $EMULATORS_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 24 "$REACT_NATIVE_TAG + $FUNCTION_EMULATORS_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 25 "$NODE_TAG" "disabled"
  echo
  f_tageMsg 26 "$NODE_TAG + $EXPRESS_TAG" "disabled"
  echo
  f_tageMsg 27 "$ELECTRON_TAG" "disabled"
  echo
  f_tageMsg 28 "$ELECTRON_TAG + $REACT_TAG" "disabled"
  echo
  f_tageMsg 29 "$ELECTRON_TAG + $REACT_TAG + $FULL_FIREBASE_TAG" "disabled"
  echo
  f_tageMsg 30 "$ELECTRON_TAG + $REACT_TAG + $FUNCTION_FIREBASE_TAG" "disabled"
  echo
  f_tageMsg 31 "$ELECTRON_TAG + $REACT_TAG + $HOSTING_FIREBASE_TAG" "disabled"
  echo
  f_tageMsg 32 "$ELECTRON_TAG + $REACT_TAG + $EMULATORS_FIREBASE_TAG" "disabled"
  echo
  f_tageMsg 33 "$ELECTRON_TAG + $REACT_TAG + $FUNCTION_EMULATORS_HOSTING_FIREBASE_TAG" "disabled"
  echo
  f_tageMsg 34 "$ELECTRON_TAG + $REACT_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 35 "$ELECTRON_TAG + $REACT_TAG + $FULL_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 36 "$ELECTRON_TAG + $REACT_TAG + $HOSTING_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 37 "$ELECTRON_TAG + $REACT_TAG + $FUNCTION_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 38 "$ELECTRON_TAG + $REACT_TAG + $EMULATORS_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_tageMsg 39 "$ELECTRON_TAG + $REACT_TAG + $FUNCTION_EMULATORS_HOSTING_FIREBASE_TAG + $MOBX_TAG" "disabled"
  echo
  f_line
  f_tageMsg 99 "exit"
  echo -e "\n\n"
}

function f_appTitle {
  echo -e "$UNDERLINE$BOLD$YELLOW_COLOR\nWelcome to the $JS_TAG$BOLD$UNDERLINE Developer Console!$1$RESET\n"
}

function f_userInput {
  echo -en "\n$RED_COLOR$BOLD▶$CYAN_COLOR▶$WHITE_COLOR▶ $LIGHT_BROWN_COLOR$BOLD$1"
  read $2
}

function f_userInputStatus {
  echo -en "\n$RED_COLOR$BOLD▶$CYAN_COLOR▶$WHITE_COLOR▶ $LIGHT_BROWN_COLOR$BOLD$1"
}

function f_clearAll {
  if (($OSTYPE == "linux-gnu" || $OSTYPE == "darwin")); then
    clear
  else
    cls
  fi
}

function f_exit_program {
  f_userMsg "$INFO_STAR" "Good bye!!!\n"
  exit 0
}

function f_selector {
  f_userInput "Select your project setup to initialize: " selectedOption
  case $selectedOption in
  1) f_htmlSetup ;;
  2) f_htmlFirebaseHostingSetup ;;
  3) f_reactjsSetup ;;
  4) f_reactjsFirebaseAllSetup ;;
  5) f_reactjsFirebaseHostingsSetup ;;
  6) f_reactjsFirebaseFunctionsSetup ;;
  7) f_reactjsFirebaseEmulatorsSetup ;;
  8) f_reactjsFirebaseFunctionEmulatorsHostingsSetup ;;
  9) f_reactjsMobxSetup ;;
  10) f_reactjsFirebaseAllMobxSetup ;;
  11) f_reactjsFirebaseHostingsMobxSetup ;;
  12) f_reactjsFirebaseFunctionsMobxSetup ;;
  13) f_reactjsFirebaseEmulatorsMobxSetup ;;
  14) f_reactjsFirebaseFunctionEmulatorsHostingsMobxSetup ;;
  15) f_reactNativeSetup ;;
  16) f_reactNativeFirebaseAllSetup ;;
  17) f_reactNativeFirebaseFunctionsSetup ;;
  18) f_reactNativeFirebaseEmulatorsSetup ;;
  19) f_reactNativeFirebaseFunctionEmulatorsSetup ;;
  20) f_reactNativeMobxSetup ;;
  21) f_reactNativeFirebaseAllMobxSetup ;;
  22) f_reactNativeFirebaseFunctionsMobxSetup ;;
  23) f_reactNativeFirebaseEmulatorsMobxSetup ;;
  24) f_reactNativeFirebaseFunctionEmulatorsMobxSetup ;;
  25) f_nodeSetup ;;
  26) f_nodeExpressSetup ;;
  27) f_electronjsSetup ;;
  28) f_electronjsReactjsSetup ;;
  39) f_electronjsReactjsFirebaseAllSetup ;;
  30) f_electronjsReactjsFirebaseHostingsSetup ;;
  31) f_electronjsReactjsFirebaseFunctionsSetup ;;
  32) f_electronjsReactjsFirebaseEmulatorsSetup ;;
  33) f_electronjsReactjsFirebaseFunctionEmulatorsHostingsSetup ;;
  34) f_electronjsReactjsMobxSetup ;;
  35) f_electronjsReactjsFirebaseAllMobxSetup ;;
  36) f_electronjsReactjsFirebaseHostingsMobxSetup ;;
  37) f_electronjsReactjsFirebaseFunctionsMobxSetup ;;
  38) f_electronjsReactjsFirebaseEmulatorsMobxSetup ;;
  39) f_electronjsReactjsFirebaseFunctionEmulatorsHostingsMobxSetup ;;
  99) f_exit_program ;;
  *)
    f_userMsg "$DANGER_STAR" "$RED_COLOR$BOLD""You have enter wrong key!!!$RESET"
    f_selector
    ;;
  esac
}

function f_create_dir {
  f_userInputStatus "$1"
  function create_basic_dir {
    read projectName
    f_userMsg "$INFO_STAR" "Initiating ($projectName) HTML based project in current directory..."
    if [[ -d "$CURRENT_DIR/$projectName" ]]; then
      f_userMsg "$DANGER_STAR" "There is a project which already exist with this name ($projectName)!"
      # f_userInput "Please enter a different project name: " $projectName
      f_userInputStatus "Please enter a different project name: "
      create_basic_dir
    else
      mkdir "$CURRENT_DIR/$projectName"
    fi
  }
  create_basic_dir
}

function fbi {
  echo "//  File Name: $2
//  Component Created at $(date +"%d %b, %Y - %H:%M:%S")

//  ==========================================================
//  COMPANY: ( $1 )
//
//  Created by $1 developers.
//  Copyright © $(date +%Y) $1. All rights reserved.
//  ==========================================================="
}

function f_SEO_TAGS {
  status=$1
  if [[ $status == "yes" ]]; then
    allSeo="<!-- Schema.org for Google -->
    <meta itemprop=\"name\" content=\"$seoMsg_0\">
    <meta itemprop=\"description\" content=\"$seoMsg_1\">
    <meta itemprop=\"image\" content=\"$seoMsg_2\">
    <!-- Twitter -->
    <meta name=\"twitter:card\" content=\"$seoMsg_3\">
    <meta name=\"twitter:title\" content=\"$seoMsg_4\">
    <meta name=\"twitter:description\" content=\"$seoMsg_5\">
    <meta name=\"twitter:site\" content=\"$seoMsg_6\">
    <meta name=\"twitter:creator\" content=\"$seoMsg_7\">
    <meta name=\"twitter:image:src\" content=\"$seoMsg_8\">
    <meta name=\"twitter:player\" content=\"$seoMsg_9\">
    <!-- Open Graph general (Facebook, Pinterest & Google+) -->
    <meta name=\"og:title\" content=\"$seoMsg_10\">
    <meta name=\"og:description\" content=\"$seoMsg_11\">
    <meta name=\"og:image\" content=\"$seoMsg_12\">
    <meta name=\"og:url\" content=\"$seoMsg_13\">
    <meta name=\"og:site_name\" content=\"$seoMsg_14\">
    <meta name=\"og:locale\" content=\"$seoMsg_15\">
    <meta name=\"og:video\" content=\"$seoMsg_16\">
    <meta name=\"fb:admins\" content=\"$seoMsg_17\">
    <meta name=\"fb:app_id\" content=\"$seoMsg_18\">
    <meta name=\"og:type\" content=\"$seoMsg_19\">"
  fi
}

function f_project_initialized_msg {
  f_userMsg "$SUCCESS_STAR" "$GREEN_COLOR$BOLD""Project initialized successfuly!$RESET\n"
  echo -e "    HAPPY_CODING!!!\n"
}
function nodeInstallationForLinux {
  f_userMsg "$INFO_STAR" "Choose your linux distribution? to install nodejs environment setup"
  f_tageMsg "1" "Debian and Ubuntu based distributions (More info: https://jsconsoler.web.app/docs/suported_plateform/linux/debain_and_ubuntu_distros)"
  f_tageMsg "2" "Enterprise Linux based distributions (More info: https://jsconsoler.web.app/docs/suported_plateform/linux/exterprise_distros)"
  f_userInput "Select distro: " selectedDistro

  function nodeVersionFunction {
    f_tageMsg "8" "Node version 8 (stable)"
    f_tageMsg "10" "Node version 10 (stable)"
    f_tageMsg "12" "Node version 12 (stable)"
    f_tageMsg "14" "Node version 14 (stable)"
    f_userInput "Select the node version: " selectedNodeVersion
  }

  # Here we will need to check linux distributions.....
  if [[ $selectedDistro == "1" ]]; then
    nodeVersionFunction
    sudo apt update
    sudo apt -y upgrade
    sudo apt update
    sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
    curl -sL https://deb.nodesource.com/setup_$selectedNodeVersion.x | sudo -E bash -
    sudo apt -y install nodejs
    sudo apt -y install gcc g++ make
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn
  elif [[ $selectedDistro == "2" ]]; then
    nodeVersionFunction
    curl -fsSL https://rpm.nodesource.com/setup_$selectedNodeVersion.x | sudo bash -
    sudo yum -y install nodejs
    sudo yum -y install gcc-c++ make
    sudo npm install -g yarn
  else
    f_userMsg "$DANGER_STAR" "Choose the correct distro option?"
    nodeInstallationForLinux
  fi

  echo
  echo
  f_userMsg "$SUCCESS_STAR" "$BOLD$GREEN_COLOR""These package have been installed successfuly!"
  f_userMsg "$INFO_STAR" "Current node version is \"$(node --version)\"."
  f_userMsg "$INFO_STAR" "Current npm version is \"v$(npm --version)\"."
  f_userMsg "$INFO_STAR" "Current npx version is \"v$(npx --version)\"."
  f_userMsg "$INFO_STAR" "Current yarn version is \"v$(yarn --version)\"."
  echo

}
function setNodeSetup {
  if [[ $(node --help) ]]; then
    f_userMsg "$INFO_STAR" "Nodejs ($(node --version)) is already installed on your machine!"
    f_userMsg "$INFO_STAR" "NPM Package manager (v$(npm --version)) is already installed on your machine!"
    f_userMsg "$INFO_STAR" "NPX (v$(npx --version)) is already installed on your machine!"
    f_userMsg "$INFO_STAR" "YARN Package manager (v$(yarn --version)) is already installed on your machine!"
  else
    f_userMsg "$DANGER_STAR" "Nodejs is not installed on your machine!"
    f_userMsg "$INFO_STAR" "Without Nodejs setup we can't create this project to fully configured."
    f_userInput "Do you want to install it now? (YES/no): " shallWeInstallNode

    if [[ $shallWeInstallNode == "YES" || $shallWeInstallNode == "yes" || $shallWeInstallNode == "y" || $shallWeInstallNode == "y" || $shallWeInstallNode == "" ]]; then
      # Here we will need to check OS.....
      if [[ $OSTYPE == "linux-gnu" ]]; then
        nodeInstallationForLinux
      else
        f_userMsg "$INFO_STAR " "You are not using linux operating system, Current jsConsoler only available for Linux OS."
        f_userMsg "$DANGER_STAR " "Aborting the whole process!"
        f_exit_program
      fi
    else
      f_userMsg "$INFO_STAR " "You refused the nodejs setup installation."
      f_userMsg "$DANGER_STAR " "Aborting the whole process!"
      f_exit_program
    fi
  fi

}
