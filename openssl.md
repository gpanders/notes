# NAME

openssl - OpenSSL command line tool

# COMMON OPERATIONS

## Create a self-signed certificate

   openssl req -x509 -newkey rsa:4096 -keyout localhost.key -out localhost.pem -days 365 -nodes -sha256 -subj '/CN=localhost' 

