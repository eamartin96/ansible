This project allows you to create a virtual cluster (using containers) to
practice Ansible commands

# Setps to build the cluster
## Prerequisites
### Docker
[Install Docker](https://docs.docker.com/engine/install/)

### Ansible
[Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Steps to build
### Generate the SSH keys
```bash
bash generate_keys.sh
```

### Build the Docker images
```bash
bash build_images.sh
```

### Create the containers
```bash
docker compose up -d
```

### Test access to all containers using ansible
```bash
ansible all -m ping -o
```
