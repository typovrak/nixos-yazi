# 📂 NixOS Yazi

> 🔧 NixOS module for automated Yazi document viewer setup: configuration, themes and color schemes.

## 📦 Features

- 🔒 **Secure config directory :** Creates and protects ```~/.config/yazi``` with correct ownership and permissions.

- 🎨 **Theme & color schemes :** Installs ```~/.config/yazi/yazi.toml```, ```~/.config/yazi/theme.toml```, and ```~/.config/yazi/Catppuccin-mocha.tmTheme``` into the user’s config.

- 🔄 **Idempotent :** Cleans and recreates config on each rebuild for consistent setup.

- ⚙️ **Zero-friction setup**: Works out-of-the-box with minimal options.

- 📦 **Dependency handling :** Ensures ```yazi``` is added to ```environment.systemPackages```.

- 💾 **Backups**: Backup commands for existing configs are detailed in the docs.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/yazi{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-yazi = fetchGit {
    url = "https://github.com/typovrak/nixos-yazi.git";
    ref = "main";
    rev = "6d5c026706aa35d57c1ba50abc83ee05525ab816"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-yazi}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```
## 🎬 Usage

Open directories with the ```yazi``` command in your terminal, with ```xdg-open .``` if yazi is your default file explorer or with the dmenu in i3.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
