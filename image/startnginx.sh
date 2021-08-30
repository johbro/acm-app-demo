#!/bin/sh

HOSTNAME=`hostname`
CLUSTERENV=`nslookup $KUBERNETES_SERVICE_HOST | awk -F '=' {'print $2'}`
echo -e "<footer class='text-center'>\n<p>Served from container: $HOSTNAME running on $CLUSTERENV</p>\n</footer>\n</html>\n" >> index.html

nginx -g "daemon off;"
