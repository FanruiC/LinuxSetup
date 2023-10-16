# LinuxSetup for MSI
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
Dowloading installation shell script from [Anaconda Download](https://www.anaconda.com/download) Run to install:
After initialisation, run:
```
conda config --set auto_activate_base false
```
Run to start anaconda navigator:
```
conda activate
anaconda-navigator
```
### gmsh
Download the latest stable binary from gmsh web.
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
#### libslatec & liblapack
Download and install slatec and lapack from [NETLIB](netlib.org)
> lapack is needed for slatec
> lapack3 is the package name that ubuntu installed by default.
Run the following to check if lapack exists:
```
dpkg -l | grep liblapck
or
apt list --installed | grep liblapack
```
Run the following to check where lapack locates:
```
dpkg -L liblapack3
```
Can be installed manually by:
```
cp make.inc.example make.inc
make
```
When compiling slatec, add to FFLAGS
```
-std=legacy
```
> std=legacy implies -fallow-argument-mismatch. See [GCC GNU POST](https://gcc.gnu.org/onlinedocs/gfortran/Fortran-Dialect-Options.html)
#### Benchmark
simple curved pipe 500 steps time:
- 4 p-cores
```
total elapsed time             :   6.87770E+01 sec
total solver time w/o IO       :   6.75993E+01 sec
time/timestep                  :   1.35199E-01 sec
avg throughput per timestep    :   4.83097E+05 gridpts/CPUs
total max memory usage         :   7.62421E-01 GB
```
- 8 p-cores
```
total elapsed time             :   4.11416E+01 sec
total solver time w/o IO       :   4.02011E+01 sec
time/timestep                  :   8.04022E-02 sec
avg throughput per timestep    :   4.06171E+05 gridpts/CPUs
total max memory usage         :   1.06496E+00 GB
```
- 8 p-cores with 16 e-cores
```
total elapsed time             :   5.79000E+01 sec
total solver time w/o IO       :   5.52794E+01 sec
time/timestep                  :   1.10559E-01 sec
avg throughput per timestep    :   9.84604E+04 gridpts/CPUs
total max memory usage         :   3.06190E+00 GB
```
- 16 cores with hyper-threads
```
total elapsed time             :   4.49439E+01 sec
total solver time w/o IO       :   4.31479E+01 sec
time/timestep                  :   8.62959E-02 sec
avg throughput per timestep    :   1.89215E+05 gridpts/CPUs
total max memory usage         :   1.90515E+00 GB
```
- 24 cores with hyper-threads
```
total elapsed time             :   3.93593E+01 sec
total solver time w/o IO       :   3.75096E+01 sec
time/timestep                  :   7.50192E-02 sec
avg throughput per timestep    :   1.45105E+05 gridpts/CPUs
total max memory usage         :   3.01625E+00 GB
```
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
### X11 NOT working well on multi-scale for different monitors
X11 has only a global scale setting for monitors. Wayland can fix this as mentioned by [this post](https://www.reddit.com/r/Kubuntu/comments/qgdm7g/comment/ifey5h4/)
```
sudo apt install plasma-workspace-wayland
```
### Dolphin is NOT loading .bashrc or .zshrc well
A temporary solution [this post](https://unix.stackexchange.com/questions/720191/kde-dolphin-terminal-is-not-loading-bashrc-or-profile)
> This is a dolphin bug, setting dolphin fix startup location is a workaround.
