#!/bin/sh
### This script exports your GPG private and public keys to files ###
KEY=C0BA3A2B5CF410DC
gpg --export-secret-keys -a $KEY > privkey.asc
gpg --export -a $KEY > pubkey.asc
echo "Exported to privkey.asc and pubkey.asc"
