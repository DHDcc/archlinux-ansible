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
> [!NOTE]
> This will install [nerd-fonts-git](https://aur.archlinux.org/packages/nerd-fonts-git) and this package is almost 6 GiB in size.
>
> If you want to remove it, go to ```archlinux-ansible/ansible/group_vars/all/vars.yml``` and remove it from the fonts section.

> [!TIP]
> you can disable/enable some options by editing: ```archlinux-ansible/ansible/group_vars/all/options.yml```.
> 
> Example: ```amdgpu: true # Set 'amdgpu' to 'false' if you have a Nvidia gpu.```

### 4. Reboot
To complete the installation, reboot your system:
```
reboot
```
