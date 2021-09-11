# !/bin/bash
cd src && chmod +x *
source config.sh
source style.sh

f_clearAll
f_appTitle " (installer)"
f_tageMsg "i" "Install"
f_tageMsg "u" "Uninstall"
f_tageMsg "e" "Exit"
f_line
f_userInput "Select any option: " startInputer

if [[ $startInputer == "i" ]]; then
  if [[ -d /usr/bin/jsConsoler_favicons ]]; then
    f_userMsg "$INFO_STAR" "Software is already installed!"
    f_userMsg "$INFO_STAR" "To run the command just type $DISABLED_COLOR jsConsoler $RESET on your favorite terminal.\n\n"
  else
    f_userMsg "$SUCCESS_STAR" "Installation started!"
    f_userMsg "$SUCCESS_STAR" "Installing..."
    sudo cp -r ./style.sh /usr/bin/jsConsoler_style.sh
    sudo cp -r ./pkg.sh /usr/bin/jsConsoler_pkg.sh
    sudo cp -r ./config.sh /usr/bin/jsConsoler_config.sh
    sudo cp -r ./main_js_consoler.sh /usr/bin/jsConsoler
    sudo cp -r ./templates/html.sh /usr/bin/jsConsoler_html.sh
    sudo mkdir /usr/bin/jsConsoler_favicons
    sudo cp -r ./templates/favicons/* /usr/bin/jsConsoler_favicons
    echo
    f_userMsg "$INFO_STAR" "To run the command just type $DISABLED_COLOR jsConsoler $RESET on your favorite terminal."
    f_userMsg "$SUCCESS_STAR" "Installation Completed!\n\n"
  fi
elif [[ $startInputer == "u" ]]; then
  f_userMsg "$DANGER_STAR" "Unstallation started!"
  f_userMsg "$DANGER_STAR" "Unstalling..."
  sudo rm -r /usr/bin/jsConsoler_style.sh
  sudo rm -r /usr/bin/jsConsoler_pkg.sh
  sudo rm -r /usr/bin/jsConsoler_config.sh
  sudo rm -r /usr/bin/jsConsoler
  sudo rm -r /usr/bin/jsConsoler_html.sh
  sudo rm -r /usr/bin/jsConsoler_favicons
  f_userMsg "$DANGER_STAR" "Unstallation Completed!\n\n"
elif [[ $startInputer == "e" ]]; then
  f_userMsg "$DANGER_STAR" "Program exited!\n\n"
fi
cd ..
