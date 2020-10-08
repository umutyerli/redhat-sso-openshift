

# Set the ANSIBLE_ROLES_PATH to drop the roles required for the playbook locally:
# export ANSIBLE_ROLES_PATH=$(readlink -f roles)
# echo "ANSIBLE_ROLES_PATH set to: $ANSIBLE_ROLES_PATH"

# Make sure that the roles required by the playbook are installed (force the right versions
# if that's required):
ansible-galaxy install -r roles/requirements.yml --force

# Get the current user's OCP access token:
OCP_TOKEN=$(oc whoami -t)
echo "User's OCP token => $OCP_TOKEN"

# Call the local `deploy` script which runs the actual `ansible-galaxy` command
# to apply the templates to the OCP cluster.  Note the environment variables
# ("-e") passed to the `ansible-playbook` command in the `deploy` script.

TAGS='deploy'

sudo sh deploy -e ocp_user='umut@nvsconsulting.io' \
         -e ocp_token="$OCP_TOKEN" \
         -e ocp_url='https://ocp.nvsconsulting.io:8443' \
         -e namespace_name='sso-app-demo4' \
         -e import_image_stream_bool='true' \
         -e apps_subdomain='ocp.nvsconsulting.io' \
         -e persistent='true'

