# Ansible playbook: Archlinux post-installation

This playbook will install my [dotfiles](https://github.com/DHDcc/MyHyprland) and other packages you probably want.

## Installation

> [!CAUTION]
> I'm VERY new to Ansible and IaC in general, so expect some errors...

### 1.Dependencies
Install the dependencies:
```
sudo pacman -Syu ansible git
```

### 2. Acquire the playbook
Clone the git repository:
```
git clone https://github.com/DHDcc/archlinux-ansible.git
```

### 3. ( optional ) Set options
```cd``` in to the ansible directory and edit the```group_vars/all/options.yml``` file.

#### Example:  
```
amdgpu: "true" # Set 'amdgpu' to 'false' if you have a Nvidia gpu.
```

### 4. Main installation
Install the require collection by using the ```requirements.yml``` file and run the playbook:
```
ansible-galaxy collection install -r requirements.yml
ansible-playbook --ask-become-pass playbook.yml
```

### 5. Reboot
To finish the installation, you will need to reboot your system:
```
reboot
```
