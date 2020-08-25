# Either source this file or run these first two lines manually
# Source by: . ./02-vault-cli.sh
export VAULT_ADDR='http://0.0.0.0:8200'
export VAULT_TOKEN=supersecrettoken

vault status
