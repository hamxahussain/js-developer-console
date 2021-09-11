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
    echo -e " $RESET$DISABLED_COLOR[$DISABLED_COLOR$BOLD$1$RESET$DISABLED_COLOR]:  $RESET$2\n"
  else
    echo -e "$RESET$GREEN_COLOR [$GREEN_COLOR$BOLD$1$RESET$GREEN_COLOR]:  $RESET$2\n"
  fi
}
function f_tageMsg2 {
  if (((($1 - 1) % 2) == 0)); then
    echo -en "$RESET$GREEN_COLOR [$GREEN_COLOR$BOLD$1$RESET$GREEN_COLOR]: $RESET$2\t\t\t\t\t"
  else
    echo -e "$RESET$GREEN_COLOR [$GREEN_COLOR$BOLD$1$RESET$GREEN_COLOR]: $RESET$2\n"
  fi
}
function f_menu {
  f_line
  echo
  f_tageMsg " 1" "$HTML_TAG"
  f_tageMsg " 2" "$HTML_TAG + $HOSTING_FIREBASE_TAG" "disabled"
  f_tageMsg " 3" "$REACT_TAG" "disabled"
  f_tageMsg " 4" "$REACT_TAG + $FULL_FIREBASE_TAG" "disabled"
  f_tageMsg " 5" "$REACT_TAG + $FUNCTION_FIREBASE_TAG" "disabled"
  f_tageMsg " 6" "$REACT_TAG + $EMULATORS_FIREBASE_TAG" "disabled"
  f_tageMsg " 7" "$REACT_TAG + $FUNCTION_EMULATORS_FIREBASE_TAG" "disabled"
  f_tageMsg " 8" "$REACT_TAG + $MOBX_TAG" "disabled"
  f_tageMsg " 9" "$REACT_TAG + $FULL_FIREBASE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 10 "$REACT_TAG + $FUNCTION_FIREBASE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 11 "$REACT_TAG + $EMULATORS_FIREBASE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 12 "$REACT_TAG + $FUNCTION_EMULATORS_FIREBASE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 13 "$REACT_NATIVE_TAG" "disabled"
  f_tageMsg 14 "$REACT_NATIVE_TAG + $FULL_FIREBASE_TAG" "disabled"
  f_tageMsg 15 "$REACT_NATIVE_TAG + $FUNCTION_FIREBASE_TAG" "disabled"
  f_tageMsg 16 "$REACT_NATIVE_TAG + $EMULATORS_FIREBASE_TAG" "disabled"
  f_tageMsg 17 "$REACT_NATIVE_TAG + $FUNCTION_EMULATORS_FIREBASE_TAG" "disabled"
  f_tageMsg 18 "$REACT_NATIVE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 19 "$REACT_NATIVE_TAG + $FULL_FIREBASE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 20 "$REACT_NATIVE_TAG + $FUNCTION_FIREBASE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 21 "$REACT_NATIVE_TAG + $EMULATORS_FIREBASE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 22 "$REACT_NATIVE_TAG + $FUNCTION_EMULATORS_FIREBASE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 23 "$NODE_TAG" "disabled"
  f_tageMsg 24 "$NODE_TAG + $EXPRESS_TAG" "disabled"
  f_tageMsg 25 "$ELECTRON_TAG" "disabled"
  f_tageMsg 26 "$ELECTRON_TAG + $REACT_TAG" "disabled"
  f_tageMsg 27 "$ELECTRON_TAG + $REACT_TAG + $FULL_FIREBASE_TAG" "disabled"
  f_tageMsg 28 "$ELECTRON_TAG + $REACT_TAG + $FUNCTION_FIREBASE_TAG" "disabled"
  f_tageMsg 29 "$ELECTRON_TAG + $REACT_TAG + $EMULATORS_FIREBASE_TAG" "disabled"
  f_tageMsg 30 "$ELECTRON_TAG + $REACT_TAG + $FUNCTION_EMULATORS_FIREBASE_TAG" "disabled"
  f_tageMsg 31 "$ELECTRON_TAG + $REACT_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 32 "$ELECTRON_TAG + $REACT_TAG + $FULL_FIREBASE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 33 "$ELECTRON_TAG + $REACT_TAG + $FUNCTION_FIREBASE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 34 "$ELECTRON_TAG + $REACT_TAG + $EMULATORS_FIREBASE_TAG + $MOBX_TAG" "disabled"
  f_tageMsg 35 "$ELECTRON_TAG + $REACT_TAG + $FUNCTION_EMULATORS_FIREBASE_TAG + $MOBX_TAG" "disabled"
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
function f_selector {
  f_userInput "Select your project setup to initialize: " selectedOption
  case $selectedOption in
  1) f_htmlSetup ;;
  2) f_htmlFirebaseHostingSetup ;;
  3) f_reactjsSetup ;;
  4) f_reactjsFirebaseAllSetup ;;
  5) f_reactjsFirebaseFunctionsSetup ;;
  6) f_reactjsFirebaseEmulatorsSetup ;;
  7) f_reactjsFirebaseFunctionEmulatorsSetup ;;
  8) f_reactjsMobxSetup ;;
  9) f_reactjsFirebaseAllMobxSetup ;;
  10) f_reactjsFirebaseFunctionsMobxSetup ;;
  11) f_reactjsFirebaseEmulatorsMobxSetup ;;
  12) f_reactjsFirebaseFunctionEmulatorsMobxSetup ;;
  13) f_reactNativeSetup ;;
  14) f_reactNativeFirebaseAllSetup ;;
  15) f_reactNativeFirebaseFunctionsSetup ;;
  16) f_reactNativeFirebaseEmulatorsSetup ;;
  17) f_reactNativeFirebaseFunctionEmulatorsSetup ;;
  18) f_reactNativeMobxSetup ;;
  19) f_reactNativeFirebaseAllMobxSetup ;;
  20) f_reactNativeFirebaseFunctionsMobxSetup ;;
  21) f_reactNativeFirebaseEmulatorsMobxSetup ;;
  22) f_reactNativeFirebaseFunctionEmulatorsMobxSetup ;;
  23) f_nodeSetup ;;
  24) f_nodeExpressSetup ;;
  25) f_electronjsSetup ;;
  26) f_electronjsReactjsSetup ;;
  27) f_electronjsReactjsFirebaseAllSetup ;;
  28) f_electronjsReactjsFirebaseFunctionsSetup ;;
  29) f_electronjsReactjsFirebaseEmulatorsSetup ;;
  30) f_electronjsReactjsFirebaseFunctionEmulatorsSetup ;;
  31) f_electronjsReactjsMobxSetup ;;
  32) f_electronjsReactjsFirebaseAllMobxSetup ;;
  33) f_electronjsReactjsFirebaseFunctionsMobxSetup ;;
  34) f_electronjsReactjsFirebaseEmulatorsMobxSetup ;;
  35) f_electronjsReactjsFirebaseFunctionEmulatorsMobxSetup ;;
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
    f_userMsg "$SUCCESS_STAR" "Initiating ($projectName) HTML based project in current directory..."
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
