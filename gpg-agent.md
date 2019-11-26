# NAME

gpg-agent - Secret key management for GnuPG

# CONFIGURATION

default-cache-ttl N
: Time, in seconds, to cache a key after a user enters their passphrase.  Every
  time the passphrase is re-entered, the time resets.

max-cache-ttl N
: Time, in seconds, before the gpg-agent will force the user to re-enter their
  passphrase for a key.

# COMMANDS

**Restarting gpg-agent**

Normally you don't need to restart `gpg-agent` because `gpg` and other tools
that use it do all that for you. But if you do, you can use
```
gpgconf --kill gpg-agent
```
