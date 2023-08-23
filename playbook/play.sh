#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook --extra-vars 'ansible_user=user ansible_password=12345678 ansible_sudo_pass=12345678' \
--inventory 192.168.8.38, play.yml
