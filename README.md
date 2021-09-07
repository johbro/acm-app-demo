# acm-app-demo

## Architecture requirements:
* 1x top level dns domain (for myapp.mydomain.com)
* 1x ACM deployment (rhpds works)
* 2x OCP4 clusters (rhpds works, aws + aro is what I typically use)
* 1x haproxy host that serves the top level dns domain


## Instructions
* Import all OCP clusters to ACM
* Fork this repo
* Modify k8s/lbroute.yaml to point to your toplevel domain
* Add application to ACM
* point to forked github repo
* master branch
* k8s reference directory
* Once deployed, grab both local routes and add to haproxy config (example in haproxy/haproxy.cfg)
* Hit top level domain and your application should load balance across multiple clusters
