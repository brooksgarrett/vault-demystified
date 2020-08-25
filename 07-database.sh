export VAULT_TOKEN=supersecrettoken

vault secrets enable -path demo/postgres database 

vault write demo/postgres/config/docker \
  'connection_url=postgresql://{{username}}:{{password}}@postgres:5432/postgres?sslmode=disable' \
  username=postgres password=supersecretpassword plugin_name=postgresql-database-plugin \
  allowed_roles='*'

vault write demo/postgres/roles/read-user \
    db_name=docker \
    creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; \
        GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";" \
    default_ttl="1h" \
    max_ttl="24h"

vault read demo/postgres/creds/read-user