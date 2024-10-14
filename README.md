# Ansible playbook: Archlinux post-installation

This playbook will install my [dotfiles](https://github.com/DHDcc/MyHyprland) and other packages you probably want.


## Installation

> [!CAUTION]
> I'm new to Ansible and IaC (Infrastructure as Code) in general, so there may be some errors or unexpected behaviors.
> Please feel free to suggest improvements.

### 1. Dependencies
Install the necessary dependencies:
```
sudo pacman -S --needed base-devel ansible python-psutil git
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
> you can disable/enable some options by editing ```archlinux-ansible/ansible/group_vars/all/options.yml```.
> 
> <details> <summary>Options:</summary>
>
> | name  | description | type | default
> |:------|:-----------:|:-----|:-------:
> |amdgpu |download Amd packages            | boolean | true
> |aur_helper.name       |pick your favorite AUR helper             | string     | paru
> |aur_helper.binary       |if false, it will compile the AUR helper             | bool     | true
> |hypervisor       |install Qemu and VirtManager             | bool     | false
> |tweaks |if true, it will apply some tweaks to optimize* your system              | boolean     |false
> |gaming_packages|install all necessary packages for gaming     | boolean | true
> |firewall|install ufw and set some rules            | boolean | true
>  
> *check the [playbook](https://github.com/DHDcc/archlinux-ansible/blob/main/ansible/tweaks/main.yml) before enabling this option.
></details>



> [!NOTE]
>
> If you're using a Nvidia gpu, you need to set the ```amdgpu``` to ```false``` to avoid downloading Amd packages.

### 4. Reboot
To complete the installation, reboot your system:
```
reboot
```
