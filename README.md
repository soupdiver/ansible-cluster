ansible-cluster
===============

An example configuration for a web app using several servers

I arbitrarily assume that your `ansible_host` file is located in the same directory and is named `ansible_host`. Feel free to adjust to your settings

# ATTENTION
I have included sample ssh keys. These are **not** intended to be used in real. Delete them and the setup.sh will automatically generate new unique keys for you.

## First init phase
`ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook site.yml -i ansible_host -t init`

This step will setup your vms in a way that you can directly ssh into them because this is the basic requirement for ansible to work.

`SSH encountered an unknown error during the connection`
maybe wrong fingerprint in known_hosts

## Start
`ansible-playbook site.yml -i ansible_host --skip-tags=init --forks=1`

## Available Tags
* init
* setup_db (installs PostgreSQL and repmgr)
* setup_db_cluster (sets up master and slave configuration)
* setup_web (installs nginx & composer)
* setup_load_balancer
* install_app (initial installation of the web application)
* update_app (updates the web application to the latest version)

# Before start
* add the public key of the machine from where you run ansible to `group_vars/all`

## Known issues
* add `-f 1` when running multiple (vagrant) machines on one host. Otherwise apt-get often exits with an error during update or install

## TODO
* find a reliable way for adding a key to known_hosts only once
