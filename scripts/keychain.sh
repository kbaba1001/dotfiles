#!/bin/sh

for key in ${HOME}/.ssh/*.id_rsa
do
    keychain -q $key
done

sh ~/.keychain/$HOSTNAME-sh

