# OAUTH APP EXAMPLE
This is an example application using the oauth sidecar proxy to add simple OpenShift authentication to your app.
Special thanks to the folks at: https://linuxera.org/oauth-proxy-secure-applications-openshift/ for a great write up as well on this.

# Instructions

1. Create a namespace called "mywebapp" (to make your own, you can search and replace all "mywebapp" instances in the provided yamls to your name)
```
oc new-project mywebapp
```
2. Create your secret and service account, then annotate your service account with a RedirectReference (for the route)
```
oc create secret generic mywebapp-proxy --from-literal=session_secret=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c43)
oc create service account mywebapp
oc annotate serviceaccount mywebapp serviceaccounts.openshift.io/oauth-redirectreference.mywebapp='{"kind":"OAuthRedirectReference","apiVersion":"v1","reference":{"kind":"Route","name":"mywebapp-authenticated"}}'
```
3. Deploy the service, deployment, and route YAML files.

**NOTE:** *We are using the self serving cert service that OpenShift provides to generate a TLS cert for our proxy.  More info below the commands.

```
oc create -f service-with-oauth.yaml
oc create -f deployment-with-oauth.yaml
oc create -f route-with-oauth.yaml
```


Self Serving Cert Info:
Doc for Reference: [Self Serving Cert Doc](https://docs.redhat.com/en/documentation/openshift_container_platform/4.18/html-single/security_and_compliance/index#understanding-service-serving_service-serving-certificate)
You can view the annotation in service-with-oauth.yaml where it has:* 

```metadata:
  annotations:
    service.beta.openshift.io/serving-cert-secret-name: mywebapp-tls
```
This allows us to request a self serving certificate for our service.
