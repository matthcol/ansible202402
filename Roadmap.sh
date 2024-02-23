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

