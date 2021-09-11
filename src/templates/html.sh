function html_code_1 {
  echo "<!DOCTYPE html>
<html lang=\"en\">
	<head>
    <meta charset=\"utf-8\" />
    <link rel=\"icon\" href=\"./favicons/favicon.ico\" />
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />
    <meta name=\"theme-color\" content=\"#000000\" />
    <meta
      name=\"description\"
      content=\"This website is created by $1 developers.\"
    />
    <title>$1 $3</title>
    <link rel=\"apple-touch-icon\" href=\"./favicons/logo192.png\" />
    <link rel=\"manifest\" href=\"./manifest.json\" />

		<!-- Link all file below here -->
		<link rel=\"stylesheet\" href=\"./$4/css/styles.css\" />
		<link rel=\"stylesheet\" href=\"./$4/css/$2.css\" />
	</head>
	<body>
    <div class=\"\">
      <section>
        <div class=\"\">
          <h4>This is the \"$2\".html file of \"$1\" project</h4>
        </div>
      </section>
    </div>
		<script src=\"./$4/js/index.js\"></script>
	</body>
</html>  
"
}
function html_manifest_code_1 {
  echo "{
  \"short_name\": \"$1\",
  \"name\": \"This website is created by $1 developers.\",
  \"icons\": [
    {
      \"src\": \"./favicons/favicon.ico\",
      \"sizes\": \"64x64 32x32 24x24 16x16\",
      \"type\": \"image/x-icon\"
    },
		{
      \"src\": \"./favicons/logo192.png\",
      \"type\": \"image/png\",
      \"sizes\": \"192x192\"
    },
    {
      \"src\": \"./favicons/logo512.png\",
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
  echo "import { testFunction } from \"./src/app\";
testFunction();
"
}
