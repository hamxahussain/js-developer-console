# !/bin/bash

function html_code_1 {
  param_1=$1
  param_2=$2
  param_3=$3
  param_4=$4
  param_5=$5
  param_6=$6
  param_7=$7
  f_SEO_TAGS $param_7

  echo "<!DOCTYPE html>
<html lang=\"en\">
	<head>
    <!-- Common Tags -->
    <meta charset=\"utf-8\" />
    <link rel=\"icon\" href=\"./favicon.ico\" />
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />
    <meta name=\"theme-color\" content=\"#000000\" />
    <title>$param_1 $param_3</title>
    <link rel=\"apple-touch-icon\" href=\"./logo192.png\" />
    <link rel=\"manifest\" href=\"./manifest.json\" />
    <!-- Search Engine -->
    <meta name=\"description\" content=\"$param_5\">
    <meta name=\"author\" content=\"$param_6\">
    $allSeo

		<!-- Link all file below here -->
		<link rel=\"stylesheet\" href=\"./$param_4/css/styles.css\" />
		<link rel=\"stylesheet\" href=\"./$param_4/css/$param_2.css\" />
	</head>
	<body>
    <div class=\"\">
      <section>
        <div class=\"\">
          <h4>This is the \"$param_2\".html file of \"$param_1\" project</h4>
        </div>
      </section>
    </div>
		<script src=\"./$param_4/scripts/index.js\"></script>
	</body>
</html>  
"
}
function html_manifest_code_1 {
  echo "{
  \"short_name\": \"$param_1\",
  \"name\": \"$param_2\",
  \"icons\": [
    {
      \"src\": \"./favicon.ico\",
      \"sizes\": \"64x64 32x32 24x24 16x16\",
      \"type\": \"image/x-icon\"
    },
		{
      \"src\": \"./logo192.png\",
      \"type\": \"image/png\",
      \"sizes\": \"192x192\"
    },
    {
      \"src\": \"./logo512.png\",
      \"type\": \"image/png\",
      \"sizes\": \"512x512\"
    }
  ],
  \"start_url\": \".\",
  \"display\": \"standalone\",
  \"theme_color\": \"#000000\",
  \"background_color\": \"#ffffff00\"
}
"
}
function html_code_2 {
  echo "export const testFunction = () => {
	console.log(\"Hello app.js!\");
};
"
}
function html_code_3 {
  echo "import { testFunction } from \"./js/app\";
testFunction();
"
}
function react_index_file_code {
  f_SEO_TAGS $4
  echo "<!DOCTYPE html>
<html lang=\"en\">
  <head>
    <meta charset=\"utf-8\" />
    <link rel=\"icon\" href=\"%PUBLIC_URL%/favicon.ico\" />
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />
    <meta name=\"theme-color\" content=\"#000000\" />
    <!-- Search Engine -->
    <meta name=\"description\" content=\"$2\">
    <meta name=\"author\" content=\"$3\">
    $allSeo
    <link rel=\"apple-touch-icon\" href=\"%PUBLIC_URL%/logo192.png\" />
    <!--
      manifest.json provides metadata used when your web app is installed on a
      user's mobile device or desktop. See https://developers.google.com/web/fundamentals/web-app-manifest/
    -->
    <link rel=\"manifest\" href=\"%PUBLIC_URL%/manifest.json\" />
    <!--
      Notice the use of %PUBLIC_URL% in the tags above.
      It will be replaced with the URL of the \$(public) folder during the build.
      Only files inside the \$(public) folder can be referenced from the HTML.

      Unlike \"/favicon.ico\" or \"favicon.ico\", \"%PUBLIC_URL%/favicon.ico\" will
      work correctly both with client-side routing and a non-root public URL.
      Learn how to configure a non-root public URL by running \$(npm run build).
    -->
    <title>$5</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id=\"root\"></div>
    <!--
      This HTML file is a template.
      If you open it directly in the browser, you will see an empty page.

      You can add webfonts, meta tags, or analytics to this file.
      The build step will place the bundled scripts into the <body> tag.

      To begin the development, run \$(npm start) or \$(yarn start).
      To create a production bundle, use \$(npm run build) or \$(yarn build).
    -->
  </body>
</html>
"
}
function react_index_js_file_code {
  fbi "$1" "index"
  echo "
import React from \"react\";
import ReactDOM from \"react-dom\";
import \"./index.css\";
import { BrowserRouter } from \"react-router-dom\";
import App from \"./App\";
import reportWebVitals from \"./reportWebVitals\";

ReactDOM.render(
	<React.StrictMode>
		<BrowserRouter>
			<App />
		</BrowserRouter>
	</React.StrictMode>,
	document.getElementById(\"root\")
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
"
}

function react_app_js_file_code {
  fbi "$1" "App"
  echo "
import \"./App.css\";
import React, { useState, useEffect } from \"react\";
import { Switch, Route, Redirect } from \"react-router-dom\";

import Home from \"./resources/__screens/app/Home/Home\";
import Signup from \"./resources/__screens/auth/Signup/Signup\";
import Login from \"./resources/__screens/auth/Login/Login\";
import ErrorPage from \"./resources/__screens/404\";

function App({children, ...props}) {
	return (
		<>
			<Switch>
				<Route exact path=\"/\">
					<Home />
				</Route>
				<Route exact path=\"/404\">
					<ErrorPage message=\"404\"/>
				</Route>
				<Redirect to=\"404\" />
			</Switch>
		</>
	);
}

export default App;
"
}
function react_functional_component {
  fbi $1 $2
  echo "
import React from \"react\"
import \"./$3.css\"

export default function $2 ({children,...props}) {

  return (
    <>
      <div>
        <h1>$2 Page</h1>
      </div>
    </>
  )
}"
}
function react_use_dimension_hook {
  fbi $1 $2
  echo "
import { useState, useEffect } from \"react\";

function getWindowDimensions() {
  const { innerWidth: width, innerHeight: height } = window;
  return {
    width,
    height
  };
}

export default function useDimension() {
  const [windowDimensions, setWindowDimensions] = useState(getWindowDimensions());

  useEffect(() => {
    function handleResize() {
      setWindowDimensions(getWindowDimensions());
    }

    window.addEventListener(\"resize\", handleResize);
    return () => window.removeEventListener(\"resize\", handleResize);
  }, []);

  return windowDimensions;
}

"
}
function react_hooks_index_file_code {
  fbi $1 $2
  echo "
import useDimension from \"./useDimension\";

export { useDimension };
"
}
