# redhat-sso-openshift
Installs Red Hat JBoss SSO 7.4 on OpenShift Cluster via OpenShift Applier

Steps:
1. Create New OCP Project Namespace

2. Edit deploy_custom.sh to fill in details
```
ocp_user - User login for OpenShift Cluster
ocp_url - URL or IP in which the OpenShift Cluster is located at
namespace_name - Namespace created for SSO Project in Step 1
import_image_stream_bool - Input 'true' if image stream for RH SSO 7.4 needs to be imported. Input anything else if image stream does not need to be imported
apps_subdomain - subdomain used for ocp cluster
persistent - Input 'true' if SSO is to be used with persistent storage. Input anything else if SSO can be ephermal
```

3. Run deploy_custom.sh
```
sudo sh deploy_custom.sh
```