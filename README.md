# Ansible playbook: Archlinux post-installation

This playbook will install my [dotfiles](https://github.com/DHDcc/MyHyprland) and other packages you probably want.


## Installation

> [!CAUTION]
> I'm new to Ansible and IaC (Infrastructure as Code) in general, so there may be some errors or unexpected behaviors.
> Please feel free to suggest improvements.

### 1. Dependencies
Install the necessary dependencies:
```
sudo pacman -Syu --needed base-devel ansible python-psutil git
```

### 2. Get the repository
Clone the git repository:
```
git clone https://github.com/DHDcc/archlinux-ansible.git
```

### 3. Run the playbook
Install the required collection using the ```requirements``` file, then run the playbook:
```
cd archlinux-ansible/ansible
ansible-galaxy collection install -r requirements.yml
ansible-playbook --ask-become-pass playbook.yml
```

> [!TIP]
> you can disable/enable some options by editing: ```archlinux-ansible/ansible/group_vars/all/options.yml```.
> 
> Example:
> ```
> aur_helper:
>   name: "paru" # Pick your favarite aur helper.
>   binary: true
>```

> [!NOTE]
>
> If you're using a Nvidia gpu, you need to set the ```amdgpu``` option to ```false``` to avoid downloading Amd packages.

### 4. Reboot
To complete the installation, reboot your system:
```
reboot
```
