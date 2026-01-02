# Ref: https://www.ory.com/docs/hydra/self-hosted/quickstart

set -e

base_url='http://127.0.0.1:4445'

client=$(curl -s -X POST ${base_url}/admin/clients \
  -H "Authorization: Bearer _______________YOUR_HYDRA_ADMIN_API_BEARER_TOKEN________________" \
  -H "Content-Type: application/json" \
  -d "{
    \"client_name\": \"Service A\",
    \"grant_types\": [\"client_credentials\"],
    \"scope\": \"${SCOPE:-service-b:read other-permission}\",
    \"audience\": ${AUDIENCE:-[\"service-b\", \"other-service\"]},
    \"token_endpoint_auth_method\": \"client_secret_post\"
  }")

client_name=$(echo "$client" | jq -c '.client_name')
client_id=$(echo "$client" | jq -c '.client_id')
client_secret=$(echo "$client" | jq -c '.client_secret')
client_audience=$(echo "$client" | jq -c '.audience')
client_scope=$(echo "$client" | jq -c '.scope')

echo "$client" | jq

echo "
---

Client created.

Client name: ${client_name}
Client ID: ${client_id}
Client secret: ${client_secret}
Client audience: ${client_audience}
Client scope: ${client_scope}

A client ID and secret should be copied into the 'oauth_sandbox' project dotenv file or runtime config.

NOTE: Make sure to run this script twice. The OAuth client for the Elixir HTTP server will need one set of credentials, and the OAuth client for the Elixir IEx \"client\" will need another set. See the README for more info.
"
