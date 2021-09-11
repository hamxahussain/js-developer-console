# -------------------- Importing files --------------------

source jsConsoler_config.sh
# ---------------------- FUNCTIONS -----------------------
function f_startMsgs {
  f_userMsg "$SUCCESS_STAR" "Create a professional project structures with basic requirements."
  f_userMsg "$SUCCESS_STAR" "Select any project setup, by typing its navigated number!\n"
}

# MAIN FUNCTION
function main {
  f_clearAll
  f_appTitle
  f_startMsgs
  f_menu
  f_selector
}

main
