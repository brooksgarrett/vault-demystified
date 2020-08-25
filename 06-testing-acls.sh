export VAULT_TOKEN=secretadmintoken
echo -----\> Admin write
vault write demo/secret/adminSecret foo=bar
echo -----\> Admin list
vault list demo/secret
echo -----\> Admin read adminSecret
vault read demo/secret/adminSecret
echo -----\> Admin read dbadmin
vault read demo/secret/dbadmin
export VAULT_TOKEN=secretdevelopertoken
echo -----\> Developer write
vault write demo/secret/developerSecret foo=bar
echo -----\> Developer list
vault list demo/secret
echo -----\> Developer read adminSecret
vault read demo/secret/adminSecret
echo -----\> Developer read dbadmin
vault read demo/secret/dbadmin
export VAULT_TOKEN=secretdefaulttoken
echo -----\> Default read
vault read demo/secret/dbadmin