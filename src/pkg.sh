# !/bin/bash

source jsConsoler_html.sh
function disabled {
  f_userMsg "$WARNING_STAR" "$DISABLED_COLOR$BOLD""Setup is out of stock!"
  f_selector
}

function f_htmlSetup {
  f_clearAll
  savedCurrentDIR=$PWD
  f_create_dir "Enter your HTML project name: "
  cd "$CURRENT_DIR/$projectName"
  mkdir -p public/src/html public/src/css/others public/src/js/{src,jquery} public/src/assets/{fonts,images,icons,svgs,jsons} public/src/util public/src/archive/2021 public/favicons

  touch public/src/css/{index.css,about.css,contact.css,service.css,blog.css,style.css} public/src/js/index.js public/src/js/src/app.js public/src/archive/2021/info.json

  html_code_1 "$projectName" "index" "| Home" "src" >public/index.html
  html_code_1 "$projectName" "about" "| About" ".." >public/src/html/about.html
  html_code_1 "$projectName" "contact" "| Contact" ".." >public/src/html/contact.html
  html_code_1 "$projectName" "service" "| Service" ".." >public/src/html/service.html
  html_code_1 "$projectName" "blog" "| Blog" ".." >public/src/html/blog.html
  html_manifest_code_1 "$projectName" >public/manifest.json
  html_code_2 >public/src/js/src/app.js
  html_code_3 >public/src/js/index.js
  cp -r /usr/bin/jsConsoler_favicons/* public/favicons

  f_userMsg "$SUCCESS_STAR" "$GREEN_COLOR$BOLD""Project initialized successfuly!$RESET\n\n"
  echo -e "$HAPPY_HACKING"
  cd $CURRENT_DIR
}

function f_htmlFirebaseHostingSetup {
  disabled
}
function f_reactjsSetup {
  disabled
}
function f_reactjsFirebaseAllSetup {
  disabled
}
function f_reactjsFirebaseFunctionsSetup {
  disabled
}
function f_reactjsFirebaseEmulatorsSetup {
  disabled
}
function f_reactjsFirebaseFunctionEmulatorsSetup {
  disabled
}
function f_reactjsMobxSetup {
  disabled
}
function f_reactjsFirebaseAllMobxSetup {
  disabled
}
function f_reactjsFirebaseFunctionsMobxSetup {
  disabled
}
function f_reactjsFirebaseEmulatorsMobxSetup {
  disabled
}
function f_reactjsFirebaseFunctionEmulatorsMobxSetup {
  disabled
}
function f_reactNativeSetup {
  disabled
}
function f_reactNativeFirebaseAllSetup {
  disabled
}
function f_reactNativeFirebaseFunctionsSetup {
  disabled
}
function f_reactNativeFirebaseEmulatorsSetup {
  disabled
}
function f_reactNativeFirebaseFunctionEmulatorsSetup {
  disabled
}
function f_reactNativeMobxSetup {
  disabled
}
function f_reactNativeFirebaseAllMobxSetup {
  disabled
}
function f_reactNativeFirebaseFunctionsMobxSetup {
  disabled
}
function f_reactNativeFirebaseEmulatorsMobxSetup {
  disabled
}
function f_reactNativeFirebaseFunctionEmulatorsMobxSetup {
  disabled
}
function f_nodeSetup {
  disabled
}
function f_nodeExpressSetup {
  disabled
}
function f_electronjsSetup {
  disabled
}
function f_electronjsReactjsSetup {
  disabled
}
function f_electronjsReactjsFirebaseAllSetup {
  disabled
}
function f_electronjsReactjsFirebaseFunctionsSetup {
  disabled
}
function f_electronjsReactjsFirebaseEmulatorsSetup {
  disabled
}
function f_electronjsReactjsFirebaseFunctionEmulatorsSetup {
  disabled
}
function f_electronjsReactjsMobxSetup {
  disabled
}
function f_electronjsReactjsFirebaseAllMobxSetup {
  disabled
}
function f_electronjsReactjsFirebaseFunctionsMobxSetup {
  disabled
}
function f_electronjsReactjsFirebaseEmulatorsMobxSetup {
  disabled
}
function f_electronjsReactjsFirebaseFunctionEmulatorsMobxSetup {
  disabled
}
