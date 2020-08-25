# Key Value Store
# https://www.vaultproject.io/docs/secrets/kv/kv-v2

vault secrets enable -path demo/secret generic
vault write demo/secret/dbadmin username=postgres password=supersecretpassword
vault read demo/secret/dbadmin