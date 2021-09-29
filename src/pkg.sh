# !/bin/bash

source jsConsoler_html.sh
function disabled {
  f_userMsg "$WARNING_STAR" "$DISABLED_COLOR$BOLD""Setup is out of stock!"
  f_selector
}
function setMetaTags {
  f_userInput "Do you want to set some \"meta\" tags for SEO purpose? (yes/NO): " seoStatus
  if [[ $seoStatus == "NO" || $seoStatus == "no" || $seoStatus == "n" || $seoStatus == "N" ]]; then
    seoStatus="no"
    f_userMsg "$INFO_STAR" "Skipping \"meta\" tags setting..."
  elif [[ $seoStatus == "YES" || $seoStatus == "yes" || $seoStatus == "y" || $seoStatus == "y" ]]; then
    seoStatus="yes"
    f_userMsg "$WARNING_STAR" "These all are the meta tags... make sure you pass everything correcty!"
    f_userInput "itemprop:name:content: " seoMsg_0
    f_userInput "itemprop:description:content: " seoMsg_1
    f_userInput "itemprop:image:content: " seoMsg_2
    f_userInput "twitter:card:content: " seoMsg_3
    f_userInput "twitter:title:content: " seoMsg_4
    f_userInput "twitter:description:content: " seoMsg_5
    f_userInput "twitter:site:content: " seoMsg_6
    f_userInput "twitter:creator:content: " seoMsg_7
    f_userInput "twitter:image:src:content: " seoMsg_8
    f_userInput "twitter:player:content: " seoMsg_9
    f_userInput "og:title:content: " seoMsg_10
    f_userInput "og:description:content: " seoMsg_11
    f_userInput "og:image:content: " seoMsg_12
    f_userInput "og:url:content: " seoMsg_13
    f_userInput "og:site_name:content: " seoMsg_14
    f_userInput "og:locale:content: " seoMsg_15
    f_userInput "og:video:content: " seoMsg_16
    f_userInput "fb:admins:content: " seoMsg_17
    f_userInput "fb:app_id:content: " seoMsg_18
    f_userInput "og:type:content: " seoMsg_19
    f_userMsg "$INFO_STAR" "\"meta\" tags setting is completed!"
  else
    seoStatus="default"
    f_userMsg "$INFO_STAR" "Skipping \"meta\" tags setting..."
  fi

}
function selectPkgManager {
  echo -e "\n\n"
  f_tageMsg "1" "YARN Package manager"
  f_tageMsg "2" "NPM Package manager"
  f_userInput "Select the package manager you want to use for this project (default is yarn): " selectedPkgManagerVariable
  f_clearAll
  echo -e "\n\n"
  f_userMsg "$INFO_STAR" "Installing some best/most usable dependencies..."
  echo
}
function configureReactManifestFile {
  minefestLine1="  \"short_name\": \"$1\","
  minefestLine2="  \"name\": \"$2\","

  awk -v minefesting1="$minefestLine1" 'NR==2 {$0=minefesting1} 1' ./public/manifest.json >./.temp.txt
  cat ./.temp.txt >./public/manifest.json
  awk -v minefesting1="$minefestLine2" 'NR==3 {$0=minefesting1} 1' ./public/manifest.json >./.temp.txt
  cat ./.temp.txt >./public/manifest.json
  rm ./.temp.txt
}
function reactjs {
  f_clearAll
  echo -e "\n\n"
  f_userMsg "$WARNING_STAR" "Name can only contain URL-friendly characters, do not pass any space, double quote or Capital Charactor"
  f_create_dir "Enter your Reactjs project name: "
  cd "$CURRENT_DIR/$projectName"
  f_userInput "Company Name: " companyName
  f_userInput "Website Home Page title: " title
  f_userInput "Website description: " description
  f_userInput "Auther name: " author
  setNodeSetup
  cd ..
  rm -r $projectName
  npx create-react-app $projectName
  cd $projectName
  selectPkgManager
  if [[ $selectedPkgManagerVariable == "2" ]]; then
    if [[ -f yarn.lock ]]; then
      rm -r yarn.lock
    fi
    npm install
    npm install react-router-dom dotenv framer-motion lodash react-responsive react-star-ratings react-switch uuid react-icons react-google-maps
  else
    if [[ -f package-lock.json ]]; then
      rm -r package-lock.json
    fi
    yarn
    yarn add react-router-dom dotenv framer-motion lodash react-responsive react-star-ratings react-switch uuid react-icons react-google-maps
  fi

  configureReactManifestFile "$projectName" "$description"
  cp -r /usr/bin/jsConsoler_favicons/* ./public/
  # Configuring Index.html file
  react_index_file_code "$projectName" "$description" "$author" "$seoStatus" "$title" >./public/index.html
  echo "" >./src/App.css
  react_index_js_file_code "$companyName" >./src/index.js
  react_app_js_file_code "$companyName" >./src/App.js

  mkdir -p ./src/resources/{__screens/{app/Home,auth/Login,auth/Signup},__stores/util,__events,__hooks,__configs,__constants,__components/{public/css,private/css},__assets/{images,icons,jsons,svgs,fonts}}

  touch ./src/resources/{__stores/index.js,__configs/{api,theme}.js,__components/{public/css/styles,private/css/styles}.css,__constants/{global,color,zindex}.js,__screens/{404.css,app/Home/home.css,auth/{Login/login,Signup/signup}.css}}

  react_functional_component "$companyName" "Home" "home" >./src/resources/__screens/app/Home/Home.js
  react_functional_component "$companyName" "Error" "404" >./src/resources/__screens/404.js
  react_functional_component "$companyName" "Login" "login" >./src/resources/__screens/auth/Login/Login.js
  react_functional_component "$companyName" "Signup" "signup" >./src/resources/__screens/auth/Signup/Signup.js
  react_use_dimension_hook "$companyName" "useDimension" >./src/resources/__hooks/useDimension.js
  react_hooks_index_file_code "$companyName" "index" >./src/resources/__hooks/index.js
}
function checkBasicFirebaseSetup {
  checkFirebaseCommand=($(firebase --version))
  if [[ "$checkFirebaseCommand" == "" ]]; then
    sudo npm install -g firebase-tools
  fi

  accountList=($(firebase login:list))
  allAccounts=$(firebase login:list)
  isAnyFirebaseAccountExist="${accountList[2]} ${accountList[3]} ${accountList[4]}"

  if [[ $isAnyFirebaseAccountExist == "No authorized accounts," ]]; then
    f_userMsg "$DANGER_STAR" "No account is logged in in your system!"
    f_userMsg "$INFO_STAR" "Logging in..."
    firebase login
  fi
  f_userMsg "$INFO_STAR" "These accounts are currently logged in into your system machine through CLI."
  f_userMsg "$INFO_STAR" "$allAccounts"
  f_userInput "Do you want to logged in on another account which are not logged in yet (yes/NO): " wantToUseAnotherFirebaseAccount
  if [[ $wantToUseAnotherFirebaseAccount == "YES" || $wantToUseAnotherFirebaseAccount == "yes" || $wantToUseAnotherFirebaseAccount == "y" || $wantToUseAnotherFirebaseAccount == "y" ]]; then
    firebase login:add
  fi
}

function f_htmlSetup {
  f_clearAll
  f_create_dir "Enter your HTML project name: "
  cd "$CURRENT_DIR/$projectName"
  f_userInput "Website description: " description
  f_userInput "Auther name: " author
  setMetaTags

  mkdir -p public/html/{extra1,extra2} public/resources/css/others public/resources/scripts/{js,jquery} public/resources/assets/{fonts,images,icons,svgs,jsons} public/resources/util public/resources/archive/2021

  touch public/resources/css/{index.css,about.css,contact.css,service.css,blog.css,style.css} public/resources/scripts/index.js public/resources/scripts/js/app.js public/resources/archive/2021/info.json

  html_code_1 "$projectName" "index" "| Home" "resources" "$description" "$author" "$seoStatus" >public/index.html
  html_code_1 "$projectName" "about" "| About" "resources" "$description" "$author" "$seoStatus" >public/about.html
  html_code_1 "$projectName" "contact" "| Contact" "resources" "$description" "$author" "$seoStatus" >public/contact.html
  html_code_1 "$projectName" "service" "| Service" "resources" "$description" "$author" "$seoStatus" >public/service.html
  html_code_1 "$projectName" "blog" "| Blog" "resources" "$description" "$author" "$seoStatus" >public/blog.html
  html_manifest_code_1 "$projectName" "$description" >public/manifest.json
  html_code_2 >public/resources/scripts/js/app.js
  html_code_3 >public/resources/scripts/index.js
  cp -r /usr/bin/jsConsoler_favicons/* public/

  f_project_initialized_msg
  cd $CURRENT_DIR
}
function f_htmlFirebaseHostingSetup {
  disabled
}
function f_reactjsSetup {
  reactjs
  f_clearAll
  setMetaTags
  f_project_initialized_msg
  cd $CURRENT_DIR
}
function f_reactjsFirebaseAllSetup {
  checkBasicFirebaseSetup
  reactjs
  f_userMsg "$INFO_STAR" "These all are the firebase project list of a current user which is active now."
  f_clearAll
  firebase projects:list
  firebase init hosting
  f_clearAll
  f_userMsg "$INFO_STAR" "HOSTING environment is successfully initialized, now FUNCTIONS setup started..."
  firebase init functions
  f_clearAll
  f_userMsg "$INFO_STAR" "FUNCTIONS environment is successfully initialized, now EMULATORS setup started..."
  firebase init emulators
  f_clearAll
  f_userMsg "$INFO_STAR" "EMULATORS environment is successfully initialized, now DATASTORE setup started..."
  f_tageMsg "1" "Firestore (Big Datastore)"
  f_tageMsg "2" "Database (Small Datastore)"
  f_tageMsg "3" "Both"
  f_userInput "Choose datastore (default 1): " databaseSelection
  if [[ $databaseSelection == 2 ]]; then
    firebase init database
  elif [[ $databaseSelection == 3 ]]; then
    firebase init database
    firebase init firestore
  else
    firebase init firestore
  fi
  f_clearAll
  f_userMsg "$INFO_STAR" "DATASTORE environment is successfully initialized, now STORAGE setup started..."
  firebase init storage

  packageJsonScriptChanger="    \"build\": \"react-scripts build\",
    \"build-hosting-deploy\":\"react-scripts build && firebase deploy --only hosting\",
    \"hosting-deploy\": \"firebase deploy --only hosting\",
    \"hosting-enable\": \"firebase deploy --only hosting\",
    \"hosting-disable\": \"firebase hosting:disable\",
    \"functions-lint\": \"cd functions && eslint .\",
    \"functions-lint-fix\": \"cd functions && eslint . --fix\",
    \"functions-serve\": \"cd functions && firebase emulators:start --only functions\",
    \"functions-shell\": \"cd functions && firebase functions:shell\",
    \"functions-start\": \"cd functions && npm run shell\",
    \"functions-deploy\": \"cd functions && firebase deploy --only functions\",
    \"functions-logs\": \"cd functions && firebase functions:log\",
    \"emulator-start-all\": \"firebase emulators:start\",
    \"emulator-start-only-functions\": \"firebase emulators:start --only functions\",
    \"emulator-start-only-firestore\": \"firebase emulators:start --only firestore\",
    \"emulator-start-only-database\": \"firebase emulators:start --only database\",
    \"emulator-start-only-storage\": \"firebase emulators:start --only storage\",
    \"emulator-start-only-auth\": \"firebase emulators:start --only auth\",
    \"emulator-start-only-hosting\": \"firebase emulators:start --only hosting\",
    \"emulator-start-only-pubsub\": \"firebase emulators:start --only pubsub\","
  awk -v var1="$packageJsonScriptChanger" 'NR==17 {$0=var1} 1' ./package.json >./.temp.txt
  cat ./.temp.txt >./package.json
  rm ./.temp.txt

  f_clearAll
  setMetaTags
  f_project_initialized_msg
  cd $CURRENT_DIR
}
function f_reactjsFirebaseHostingsSetup {
  checkBasicFirebaseSetup
  reactjs
  f_userMsg "$INFO_STAR" "These all are the firebase project list of a current user which is active now."
  f_clearAll
  echo -e "\n\n"
  f_userMsg "$WARNING_STAR" "REMEMBER, when you have been ask for this question \"What do you want to use as your public directory? (public)\", then just type \"build\" and hit enter, okay?"
  f_userInput "to go furthers just hit enter..."
  firebase projects:list
  firebase init hosting

  packageJsonScriptChanger="    \"build\": \"react-scripts build\",
    \"build-hosting-deploy\":\"react-scripts build && firebase deploy --only hosting\",
    \"hosting-deploy\": \"firebase deploy --only hosting\",
    \"hosting-enable\": \"firebase deploy --only hosting\",
    \"hosting-disable\": \"firebase hosting:disable\","
  awk -v var1="$packageJsonScriptChanger" 'NR==17 {$0=var1} 1' ./package.json >./.temp.txt
  cat ./.temp.txt >./package.json
  rm ./.temp.txt

  f_clearAll
  setMetaTags
  f_project_initialized_msg
  cd $CURRENT_DIR
}
function f_reactjsFirebaseFunctionsSetup {
  checkBasicFirebaseSetup
  reactjs
  f_userMsg "$INFO_STAR" "These all are the firebase project list of a current user which is active now."
  f_clearAll
  firebase projects:list
  firebase init functions

  packageJsonScriptChanger="    \"build\": \"react-scripts build\",
    \"functions-lint\": \"cd functions && eslint .\",
    \"functions-lint-fix\": \"cd functions && eslint . --fix\",
    \"functions-serve\": \"cd functions && firebase emulators:start --only functions\",
    \"functions-shell\": \"cd functions && firebase functions:shell\",
    \"functions-start\": \"cd functions && npm run shell\",
    \"functions-deploy\": \"cd functions && firebase deploy --only functions\",
    \"functions-logs\": \"cd functions && firebase functions:log\","
  awk -v var1="$packageJsonScriptChanger" 'NR==17 {$0=var1} 1' ./package.json >./.temp.txt
  cat ./.temp.txt >./package.json
  rm ./.temp.txt
  mkdir -p ./functions/resources
  touch ./functions/resources/app.js

  f_clearAll
  setMetaTags
  f_project_initialized_msg
  cd $CURRENT_DIR
}
function f_reactjsFirebaseEmulatorsSetup {
  checkBasicFirebaseSetup
  reactjs
  f_userMsg "$INFO_STAR" "These all are the firebase project list of a current user which is active now."
  f_clearAll
  firebase projects:list
  firebase init emulators

  packageJsonScriptChanger="    \"build\": \"react-scripts build\",
    \"emulator-start-all\": \"firebase emulators:start\",
    \"emulator-start-only-functions\": \"firebase emulators:start --only functions\",
    \"emulator-start-only-firestore\": \"firebase emulators:start --only firestore\",
    \"emulator-start-only-database\": \"firebase emulators:start --only database\",
    \"emulator-start-only-storage\": \"firebase emulators:start --only storage\",
    \"emulator-start-only-auth\": \"firebase emulators:start --only auth\",
    \"emulator-start-only-hosting\": \"firebase emulators:start --only hosting\",
    \"emulator-start-only-pubsub\": \"firebase emulators:start --only pubsub\","
  awk -v var1="$packageJsonScriptChanger" 'NR==17 {$0=var1} 1' ./package.json >./.temp.txt
  cat ./.temp.txt >./package.json
  rm ./.temp.txt

  f_clearAll
  setMetaTags
  f_project_initialized_msg
  cd $CURRENT_DIR
}
function f_reactjsFirebaseFunctionEmulatorsHostingsSetup {
  checkBasicFirebaseSetup
  reactjs
  f_userMsg "$INFO_STAR" "These all are the firebase project list of a current user which is active now."
  f_clearAll
  firebase projects:list
  firebase init hosting
  f_clearAll
  f_userMsg "$INFO_STAR" "HOSTING environment is setuped, now FUNCTIONS setup started."
  firebase init functions
  f_userMsg "$INFO_STAR" "FUNCTIONS environment is setuped, now EMULATORS setup started."
  firebase init emulators

  packageJsonScriptChanger="    \"build\": \"react-scripts build\",
    \"build-hosting-deploy\":\"react-scripts build && firebase deploy --only hosting\",
    \"hosting-deploy\": \"firebase deploy --only hosting\",
    \"hosting-enable\": \"firebase deploy --only hosting\",
    \"hosting-disable\": \"firebase hosting:disable\",
    \"functions-lint\": \"cd functions && eslint .\",
    \"functions-lint-fix\": \"cd functions && eslint . --fix\",
    \"functions-serve\": \"cd functions && firebase emulators:start --only functions\",
    \"functions-shell\": \"cd functions && firebase functions:shell\",
    \"functions-start\": \"cd functions && npm run shell\",
    \"functions-deploy\": \"cd functions && firebase deploy --only functions\",
    \"functions-logs\": \"cd functions && firebase functions:log\",
    \"emulator-start-all\": \"firebase emulators:start\",
    \"emulator-start-only-functions\": \"firebase emulators:start --only functions\",
    \"emulator-start-only-firestore\": \"firebase emulators:start --only firestore\",
    \"emulator-start-only-database\": \"firebase emulators:start --only database\",
    \"emulator-start-only-storage\": \"firebase emulators:start --only storage\",
    \"emulator-start-only-auth\": \"firebase emulators:start --only auth\",
    \"emulator-start-only-hosting\": \"firebase emulators:start --only hosting\",
    \"emulator-start-only-pubsub\": \"firebase emulators:start --only pubsub\","
  awk -v var1="$packageJsonScriptChanger" 'NR==17 {$0=var1} 1' ./package.json >./.temp.txt
  cat ./.temp.txt >./package.json
  rm ./.temp.txt

  f_clearAll
  setMetaTags
  f_project_initialized_msg
  cd $CURRENT_DIR
}
function f_reactjsMobxSetup {
  disabled
}
function f_reactjsFirebaseAllMobxSetup {
  disabled
}
function f_reactjsFirebaseHostingsMobxSetup {
  disabled
}
function f_reactjsFirebaseFunctionsMobxSetup {
  disabled
}
function f_reactjsFirebaseEmulatorsMobxSetup {
  disabled
}
function f_reactjsFirebaseFunctionEmulatorsHostingsMobxSetup {
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
function f_electronjsReactjsFirebaseHostingsSetup {
  disabled
}
function f_electronjsReactjsFirebaseFunctionsSetup {
  disabled
}
function f_electronjsReactjsFirebaseEmulatorsSetup {
  disabled
}
function f_electronjsReactjsFirebaseFunctionEmulatorsHostingsSetup {
  disabled
}
function f_electronjsReactjsMobxSetup {
  disabled
}
function f_electronjsReactjsFirebaseAllMobxSetup {
  disabled
}
function f_electronjsReactjsFirebaseHostingsMobxSetup {
  disabled
}
function f_electronjsReactjsFirebaseFunctionsMobxSetup {
  disabled
}
function f_electronjsReactjsFirebaseEmulatorsMobxSetup {
  disabled
}
function f_electronjsReactjsFirebaseFunctionEmulatorsHostingsMobxSetup {
  disabled
}
