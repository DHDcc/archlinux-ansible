# Ansible playbook: Archlinux post-installation

## Description
This playbook will install my [dotfiles](https://github.com/DHDcc/MyHyprland) and other packages you probably want.

## Installation

> [!CAUTION]
> I'm VERY new to Ansible and IaC in general, so expect some errors...

### 1. Install dependencies:
```
sudo pacman -Syu ansible git
```

### 2. Clone repo:
```
git clone https://github.com/DHDcc/archlinux-ansible.git
```

### 3. Add your username in to the options file ( ansible/group_vars/all/options.yml ):
```
username: "USER" # Replace 'USER' with your username.
```

> [!TIP]
> You can also enable or disable options in the file by using ```true``` or ```false```.
>
> Example:  ```amdgpu: "true" # Set 'amdgpu' to 'false' if you have a Nvidia gpu```

### 4. Install require collection and run the playbook:
```
ansible-galaxy collection install -r requirements.yml
ansible-playbook --ask-become-pass playbook.yml
```

### 5. Reboot system :
```
reboot
```
