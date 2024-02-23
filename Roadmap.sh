# Computer
docker compose up -d
docker compose exec -it pilot bash

# Pilot
su - srvadmin
sudo apt install ansible sshpass

# for all hosts
# ssh host key exchange
ssh host1
ansible
ansible -i hosts -m ping all
ansible -i hosts -k -m ping all
ansible -i hosts -k -u srvadmin -m ping all

# edit ansible config: /etc/ansible/ansible.cfg
[defaults]
interpreter_python=/usr/bin/python3

ansible -i hosts -k -a "path=/tmp/dummy.txt state=touch" -m ansible.builtin.file rocky
ansible -i hosts -k -a "path=/tmp/dummy state=directory" -m ansible.builtin.file rocky
ansible -i hosts -k -a "path=/tmp/dummy state=absent" -m ansible.builtin.file rocky

# SSH password (-k) + sudo password (-K) + become (-b : method sudo => user root)
ansible-playbook -i hosts -k -K -b userdeploy-playbook.yml
# become settings in the playbook
ansible-playbook -i hosts -k -K userdeploy-playbook.yml

ssh-keygen
file: /home/srvadmin/.ssh/id_rsa_deploy
with passphrase !

ssh -i ~/.ssh/id_rsa_deploy deployuser@host1
type passphrase !

ssh-agent
ssh-add ~/.ssh/id_rsa_deploy
ssh-add -L
ssh-add -D

ansible -i hosts -u deployuser -m ping all

# Playbook with roles
ansible-galaxy init roles/common
ansible-galaxy init roles/db
ansible-galaxy init roles/api


# with variables
ansible-playbook -i hosts -k -K -u srvadmin userdeploy2-playbook2.yml
ansible-playbook -i hosts -u deployuser -e "username=deployuser2" userdeploy2-playbook.yml
ansible -i hosts -u deployuser2 -m ping all
ansible-playbook -i hosts -u deployuser -e "username=deployuser2" removeuser-playbook.yml

# 03-appdb
ansible-playbook -u deployuser -i hosts deploy-playbook.yml 

# DAY 2

# mode verbose
ansible-playbook -u deployuser -i hosts -v deploy-playbook.yml 
ansible-playbook -u deployuser -i hosts -vv deploy-playbook.yml 
ansible-playbook -u deployuser -i hosts -vvv deploy-playbook.yml 

# info pattern hosts/play
ansible-playbook -i hosts --list-hosts deploy-playbook.yml

# info tasks
ansible-playbook -i hosts --list-tasks deploy-playbook.yml 

ansible-playbook -i hosts --list-tasks --list-hosts deploy-playbook.yml 

# play only a part 
# start at task
ansible-playbook -u deployuser -i hosts --start-at-task "Prepare Filesystem" deploy-playbook.yml
# tags
# https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_tags.html
# NB: tag role => gathering_facts OK, tag task only => gathering_facts disable


 ansible-playbook -u deployuser -i hosts -t API deploy-playbook.yml
 ansible-playbook -u deployuser -i hosts -t DB deploy-playbook.yml
 ansible-playbook -u deployuser -i hosts -t "USER,FS" deploy-playbook.yml

ansible-playbook -u deployuser -i hosts -t "API" --skip-tags "USER,FS"  deploy-playbook.yml
ansible-playbook -u deployuser -i hosts --start-at-task "Prepare Filesystem" deploy-playbook.yml

# ansible.cfg to allow privilege desescalation (not entirely secure)
[defaults]
allow_world_readable_tmpfiles=yes
interpreter_python=/usr/bin/python3


