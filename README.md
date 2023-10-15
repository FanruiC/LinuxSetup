# LinuxSetup
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
### paraview
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
