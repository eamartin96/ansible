ssh-keygen -t rsa -N "" -f ansible

mkdir keys
mv ansible ansible.pub keys/
