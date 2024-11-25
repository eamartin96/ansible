if ssh-keygen -t rsa -N "" -f ssh_ansible > /dev/null 2>&1; then
    echo "SSH keys successfully generated"
    mkdir keys
    mv ssh_ansible ssh_ansible.pub keys/
else
    echo "Failed to generate SSH keys"
fi
