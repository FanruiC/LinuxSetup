# LinuxSetup
From Bilibili: [8分钟让你快速掌握Markdown](https://www.bilibili.com/video/BV1JA411h7Gw/?spm_id_from=333.337.search-card.all.click&vd_source=87f333e21626c3c3bbbb43b6711d2d81)
## Compulsory Settings
### Time
> Windows sees BIOS time (REAL-TIME-CLOCK RTC) as local time, Linux sees BIOS time as UTC.
```
sudo timedatectl set-local-rtc 1
```
### Input Method
> FCITX (Flexible Input Method Framework for Chinese and Various Languages) is an open-source input method framework primarily used in Linux-based operating systems.
```
sudo apt install fcitix
sudo apt install fcitix-googlepinyin
Applications > Input Method > activate fcitix
reboot
fcitix configtools (checking googlepinyin, do miscellaneous settings)
```
### Duo Display
Install [DisplayLink USB Graphics Software for Ubuntu](https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu)
> It is good to use Synaptics APT Repository to do the installation
### SSH
```
mkdir ~/.ssh
vim config
```
输入：
```
Host xxx
  HostName
  Port
  User
```
Auto login:
```
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub [hostname]
```
### Inputrc
```
set completion-ignore-case on
```
> Add the above to .inputrc in BASH SHELL ONLY, omz has already included this function
### Update .zshrc from cloud

## Software Settings
### omz pluggins
```
plugins = (command-not-found colored-man-page)
```
> In .zshrc
### anaconda
### gmsh
### nek5000
Use "git clone --recursive" to contain "example folder". If fogot:
Use the following to update:
```
git submodule init
git submodule update
```
Install the following:
```
sudo apt-get update
sudo apt install build-essential  #provides gcc
sudo apt install gfortran         #provides gfortran
sudo apt install libopenmpi-dev   #provides openmpi
```
> This is an auto way to install openmpi, need to configure compiling flags for eg. slatec etc.
### paraview
Paraview is built locally for best performance. Follow [Build Paraview Gitlab](https://gitlab.kitware.com/paraview/paraview/-/blob/master/Documentation/dev/build.md#linux) to finish build.
> When building: p-core 4.6Ghz, e-core 3.6Ghz. Took 5-10 mins. Fan is NOT running loudly. Avg temps 80-85C. Max P-core temp 97C with 5.6Ghz.
### code

## Issues Fix
### GPU 525 driver not getting information from sensors
Solved by [modified nvidia-msi](https://www.reddit.com/r/kde/comments/zszj00/problem_gpu_sensor_in_kde_system_monitor_is_not/)
### 系统保留空间太大
Checking disk usage by:
```
df -hl
```
run
```
sudo tune2fs -m 0 /dev/device
```
用于设置系统空间为0%而不是默认的5%
### Chrome 页面按住拖动bug
> 暂未找解决办法

