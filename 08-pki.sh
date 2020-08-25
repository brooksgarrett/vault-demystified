vault secrets enable -path demo/pki pki

vault secrets tune -max-lease-ttl=8760h demo/pki

vault write demo/pki/root/generate/internal \
    common_name=brooks-demo-CA \
    ttl=8760h

vault write demo/pki/config/urls \
    issuing_certificates="http://127.0.0.1:8200/v1/demo/pki/ca" \
    crl_distribution_points="http://127.0.0.1:8200/v1/demo/pki/crl"

vault write demo/pki/roles/my-certificate \
    allowed_domains=my-website.com \
    allow_subdomains=true \
    max_ttl=72h

vault write demo/pki/issue/my-certificate common_name=sweet.my-website.com | tee /tmp/cert