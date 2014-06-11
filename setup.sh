#!/bin/bash

for i in {1..5}
do
  #check if key folder exists for the machine
  if [ ! -d "keys/m$i" ]; then
      mkdir -p "keys/m$i"
      echo "created key folder for machine $i"
  fi
  
  #check if key exsists for the machine
  if [ ! -f "keys/m$i/id_rsa" ]; then
      ssh-keygen -t rsa -b 4096 -C "machine$i" -f "keys/m$i/id_rsa"
      echo "created key for machine $i"
    else
      echo "machine $i already got a key"
  fi
  
  cd "machines/m$i"

  if [ $1  == "destroy" ]; then
    vagrant destroy -f
  fi
  if [ $1  == "stop" ]; then
    vagrant halt
  fi
  vagrant up
  cd ..
  cd ..
done
