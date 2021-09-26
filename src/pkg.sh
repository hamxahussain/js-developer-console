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
  f_clearAll
  echo -e "\n\n"
  f_userMsg "$WARNING_STAR" "Name can only contain URL-friendly characters, do not pass any space, double quote or Capital Charactor"
  f_create_dir "Enter your Reactjs project name: "
  cd "$CURRENT_DIR/$projectName"
  f_userInput "Company Name: " companyName
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
    npm install react-router-dom --save
  else
    if [[ -f package-lock.json ]]; then
      rm -r package-lock.json
    fi
    yarn
    yarn add react-router-dom --save
  fi
  f_clearAll

  setMetaTags
  configureReactManifestFile "$projectName" "$description"
  cp -r /usr/bin/jsConsoler_favicons/* ./public/
  # Configuring Index.html file
  react_index_file_code "$projectName" "$description" "$author" "$seoStatus" >./public/index.html
  echo "" >./src/App.css
  react_index_js_file_code "$companyName" >./src/index.js
  react_app_js_file_code "$companyName" >./src/App.js
  mkdir -p ./src/resources/{__screens/{app/Home,auth/Login,auth/Signup},__stores/util,__events,__hooks,__configs,__constants,__components/{public/css,private/css},__assets/{images,icons,jsons,svgs,fonts}}
  react_functional_component "$companyName" "Home" "home" >./src/resources/__screens/app/Home/Home.js
  react_functional_component "$companyName" "Error" "404" >./src/resources/__screens/404.js
  react_functional_component "$companyName" "Login" "login" >./src/resources/__screens/auth/Login/Login.js
  react_functional_component "$companyName" "Signup" "signup" >./src/resources/__screens/auth/Signup/Signup.js
  touch ./src/resources/__screens/404.css ./src/resources/__screens/app/Home/home.css ./src/resources/__screens/auth/Login/login.css ./src/resources/__screens/auth/Signup/signup.css

  f_project_initialized_msg
  cd $CURRENT_DIR
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
