#!/bin/bash


if [ -d "$PWD/.ssh" ]; then
  echo "----------------------------------------------------------------"
  echo "Warning! Directory '.ssh' existed in current working directory."
  echo "You have to create a empty directory and change directory into it."
  echo "Then run this script. Directory '.ssh' and keys will generated in this empty directory." 
  echo "----------------------------------------------------------------"
  exit 1
fi

mkdir -p .ssh
chmod 700 .ssh

ssh-keygen -q -t rsa -N '' -f $PWD/.ssh/id_rsa
cat $PWD/.ssh/id_rsa.pub >> $PWD/.ssh/authorized_keys

chmod 600 $PWD/.ssh/id_rsa
chmod 644 $PWD/.ssh/id_rsa.pub
chmod 600 $PWD/.ssh/authorized_keys
