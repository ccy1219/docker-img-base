#!/bin/bash

if [ ${#@} == 0 ]; then
    echo "Usage: $0 your_windows_username"
    echo "Ex. ./gen_certificate.sh michael"
    exit 0
fi

echo 'removing cert_key.pem and cert.pem if existed...'
rm cert.pem cert_key.pem

USERNAME=${1}
echo 'Generating cert_key.pem and cert.pem for '$USERNAME

# generate openssl.conf
cat > openssl.conf << EOL
distinguished_name = req_distinguished_name
[req_distinguished_name]
[v3_req_client]
extendedKeyUsage = clientAuth
subjectAltName = otherName:1.3.6.1.4.1.311.20.2.3;UTF8:$USERNAME@localhost
EOL

export OPENSSL_CONF=openssl.conf

# generate cert_key.pem and cert.pem
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -out cert.pem -outform PEM -keyout cert_key.pem -subj "/CN=$USERNAME" -extensions v3_req_client

# remote openssl.conf
rm openssl.conf