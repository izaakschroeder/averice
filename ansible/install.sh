#!/bin/sh -e

ANSIBLE_HOME=/opt/ansible
ANSIBLE_VERSION=stable-1.9
PACKAGES="git python-yaml python-paramiko python-jinja2"
REPO=git://github.com/ansible/ansible.git

PLAYBOOK="ansible/main.yml"
INVENTORY="ansible/inventories/local.ini"

yum install -y ${PACKAGES}

if [ ! -d $ANSIBLE_HOME/.git ]; then
	mkdir -p ${ANSIBLE_HOME}
	git clone ${REPO} ${ANSIBLE_HOME}
  cd $ANSIBLE_HOME
  git checkout $ANSIBLE_VERSION
else
	cd $ANSIBLE_HOME
  git checkout $ANSIBLE_VERSION
	git pull
fi


export ANSIBLE_FORCE_COLOR=true
export PYTHONUNBUFFERED=1
export PYTHONPATH="${PYTHONPATH}:${ANSIBLE_HOME}/lib"

${ANSIBLE_HOME}/bin/ansible-playbook /vagrant/${PLAYBOOK} \
	--inventory-file=/vagrant/"${INVENTORY}"
