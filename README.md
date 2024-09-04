# Ansible playbook: Archlinux post-installation

This playbook will install my [dotfiles](https://github.com/DHDcc/MyHyprland) and other packages you probably want.


## Installation

> [!CAUTION]
> I'm VERY new to Ansible and IaC in general, so expect some errors...

### 1. Dependencies
Install the necessary dependencies:
```
sudo pacman -Syu ansible git
```

### 2. Acquire the playbook
Clone the git repository:
```
git clone https://github.com/DHDcc/archlinux-ansible.git
```

### 3. ( optional ) Set options
To configure the installation, edit this file: ```archlinux-ansible/ansible/group_vars/all/options.yml```.

#### Example:  
```
amdgpu: "true" # Set 'amdgpu' to 'false' if you have a Nvidia gpu.
```

### 4. Main installation
Install the required collection using the ```requirements``` file, then run the playbook:
```
cd archlinux-ansible/ansible
ansible-galaxy collection install -r requirements.yml
ansible-playbook --ask-become-pass playbook.yml
```

### 5. Reboot
To complete the installation, reboot your system:
```
reboot
```
