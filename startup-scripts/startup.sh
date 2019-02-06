#!/usr/bin/env bash

apt-get update
apt-get install -y apache2

cat <<EOF > /var/www/html/index.html
<html><body>
<p>It works!</p>
</body></html>
EOF

echo VM is ready!
