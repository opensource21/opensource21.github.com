#!/bin/bash
BASE_URL=http://opensource21.github.io
for DIR in $(find ./releases -type d); do
  (
    echo -e "<html>\n<body>\n<h1>Directory listing</h1>\n<hr/>\n<pre>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "index.html" | awk -v "baseUrl=${BASE_URL}${DIR:1}/" '{ printf "<a href=\""baseUrl"%s\">%s</a>\n",$1,$1 }' 
    echo -e "</pre>\n</body>\n</html>"
  ) > "${DIR}/index.html"
done
git add -A
