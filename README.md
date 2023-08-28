# debkiss (Program Installers)

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](./LICENSE)  

scripts to install programs

# usage:

<!--
su -
apt install git -y
sudo usermod -aG sudo USERNAME
#logout from desktop session and login again
sudo dpkg-reconfigure keyboard-configuration
or:
sudo apt update && sudo apt install git -y  -->

```
bash -c "$(curl -fsSL https://t1p.de/debkiss-no-gui)"
```

<!--curl -sSL https://git.io/debkiss | bash-->

# alternative 1:

```
bash -c "$(wget -O - https://raw.githubusercontent.com/freddii/program_installers/master/debkiss.sh)"
```

# alternative 2:

```
cd /tmp && git clone https://github.com/freddii/program_installers && cd program_installers && ./debkiss.sh
```

# Todo:

* [ ] execute AppImages with firejail  

* [ ] shellcheck scripts
  
  ```
    # Fail if any of these files have warnings
    shellcheck program_installers/*.sh
  ```

## Contributing

* Copyright © 2020 freddii