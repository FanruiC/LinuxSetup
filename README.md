# LinuxSetup for MSI
From Bilibili: [8分钟让你快速掌握Markdown](https://www.bilibili.com/video/BV1JA411h7Gw/?spm_id_from=333.337.search-card.all.click&vd_source=87f333e21626c3c3bbbb43b6711d2d81)
## Compulsory Settings
When install kubuntu, do not select downloading updates or 3rd party libraries. It installed openmpi but is not the write one for Nek. Nek wont compile with it. Never use sudo apt autoremove. This is stupid and will remove important libraries.
### Time
> Windows sees BIOS time (REAL-TIME-CLOCK RTC) as local time, Linux sees BIOS time as UTC.
```
sudo timedatectl set-local-rtc 1
```
### Sudo command password cooling time
```
cd /etc
sudo vim sudoers
Defaults  timestamp_timeout = 120
:wq!
```
### Input Method
> FCITX (Flexible Input Method Framework for Chinese and Various Languages) is an open-source input method framework primarily used in Linux-based operating systems.
```
sudo apt install fcitx
sudo apt install fcitx-googlepinyin
Applications > Input Method > activate fcitx
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
Add anaconda icon to start menu:
go to ~/.local/share/applications
create a new ASCII text file and make it excutable:
```
[Desktop Entry]
Version=1.0
Type=Application
Name=Anaconda
Exec=/home/fanrui/anaconda3/bin/anaconda-navigator
Icon=/home/fanrui/anaconda3/lib/python3.11/site-packages/anaconda_navigator/app/icons/Icon1024.png
Terminal=false
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
> This is an auto way to install openmpi, need to configure compiling-flags in makenek for eg. slatec etc.
> WARNING: ParaView's mpiexec may impact systems mpiexec in PATH.
#### libslatec & liblapack
Download and install slatec and lapack from [NETLIB](www.netlib.org)
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

Add -v during compiling to show full information and logs, useful when need to check the ld linkage paths. Add libslatec.a to these location to avoid using -L args.
We must compile the source code first, then adding -lslatec and -llapack in the end. Otherwise the ld cannot find the correct references for functions and routines in sources.

Slatec on netlib.org has changed its order. Src file has been devided into src, lin, fishfft, fnlib, pchip intotal five libraries, thich contains intotal 1441 .f routines. Need to run:
```
wget -r -np -nH --cut-dirs=2 https://www.netlib.org/slatec/fnlib/

```
to download all the .f files then can be compiled.

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
```
total elapsed time             :   4.00763E+01 sec
total solver time w/o IO       :   3.90742E+01 sec
time/timestep                  :   7.81484E-02 sec
avg throughput per timestep    :   4.17885E+05 gridpts/CPUs
total max memory usage         :   1.06494E+00 GB
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

Paraview must be built with -DPARAVIEW_ENABLE_VISITBRIDGE=ON to enable reading NEK5000 data.
Further, to set the above option, we "might" need to set -DPARAVIEW_ENABLE_GDAL=ON
But, to set the above option, we MUST install external GDAL library by:
```
sudo apt install libgdal-dev
```
Then we can build and run paraview to read NEK5000 properly.
> Note that paraview has its own mpiexec binary in ../paraview/bin folder.
### vscode
vscode's modern fortran extension provides two debuger ways: released vs pre-released. For released version: need to configure launch.json and tasks.json. eg:
```
{
  // Use IntelliSense to learn about possible attributes.
  // Hover to view descriptions of existing attributes.
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [

    {
      "name": "(gdb) fortran",
      "type": "cppdbg",
      "request": "launch",
      "program": "${fileDirname}/a.out",
      "args": [], // Possible input args for a.out
      "stopAtEntry": false,
      "cwd": "${fileDirname}",
      "environment": [],
      "externalConsole": false,
      "MIMode": "gdb",
      "setupCommands": [
        {
          "description": "Enable pretty-printing for gdb",
          "text": "-enable-pretty-printing",
          "ignoreFailures": true,
        },
      ],
      "preLaunchTask": "gfortran_build"
    },
  ],
}
```
```
{
      // See https://go.microsoft.com/fwlink/?LinkId=733558
      // for the documentation about the tasks.json format
      "version": "2.0.0",
      "tasks": [
            {
                  "label": "gfortran_build",
                  "type": "shell",
                  "command": "gfortran ${file} -o ${fileDirname}/a.out -lslatec -llapack -g"
            }
      ]
}
```
For pre-release version: there is a button at the top right which can compile and run the code using its "default build command" (Have not idea how to change this setting), which wouldn't work
to compile with slatec and lapack.

Setting up fortls in vscode.
1. Setting fortls configure file .fortls.json in the same dir of workspace, including source file location. This can also be set in fortls extension settings (easier).
```
{
      "source_dirs": [
            "/home/fanrui/Nek5000/slatec4linux/**",
            "/home/fanrui/Nek5000/core/**",
            "/home/fanrui/Nek5000/3rd_party/**",
            "./**"
      ]
}
```
2. Setting gfortran compiler and linking searching dir where gfortran can find files where the "inlcude" statement in fortran script.(WARNING: THIS IS CURRENT NOT WORKING, A BUG OF VSCODE??)
   WARNING: MODERN FORTRAN LINTING COMPILER SETTINGS HAS AN INCLCUDE SETTING, BUT CURRENTLY NOT WORKING FOR "INLCUDE" STATEMENT IN FORTRAN SCRIPTS. SOMEONE MENTIONED THAT THIS ONLY WORKS FOR .MOD FILES [HERE](https://fortran-lang.discourse.group/t/modern-fortran-on-vscode-fails-to-recognize-external-includes/5600/5)

> A workaround (THIS WORK VERY BAD AS WELL, NEED TO CLICK ON EVERY FILE AT THE FIRST, THEN THE FILE OPENED MUST BE IN THE SAME DIR AS WORKDIR, VERY STUDID BUG): put all files that will be included in the same dir as the workspace dir.Need to set file languages for like "MASS" Nek files to fortran77 one by one manually. So that by this way vscode know its fortran and fortls will tell it is fortran.

```
gfortran -v -E -xc /dev/null ! Can be used to see what dirs gfotran will search include files.

gfotran -I ./ ! Can be used to add the current dir to the searching dirs for include files.
```

VSCODE Predefined variables
```
Predefined variables
The following predefined variables are supported:

${userHome} - the path of the user's home folder
${workspaceFolder} - the path of the folder opened in VS Code
${workspaceFolderBasename} - the name of the folder opened in VS Code without any slashes (/)
${file} - the current opened file
${fileWorkspaceFolder} - the current opened file's workspace folder
${relativeFile} - the current opened file relative to workspaceFolder
${relativeFileDirname} - the current opened file's dirname relative to workspaceFolder
${fileBasename} - the current opened file's basename
${fileBasenameNoExtension} - the current opened file's basename with no file extension
${fileExtname} - the current opened file's extension
${fileDirname} - the current opened file's folder path
${fileDirnameBasename} - the current opened file's folder name
${cwd} - the task runner's current working directory upon the startup of VS Code
${lineNumber} - the current selected line number in the active file
${selectedText} - the current selected text in the active file
${execPath} - the path to the running VS Code executable
${defaultBuildTask} - the name of the default build task
${pathSeparator} - the character used by the operating system to separate components in file paths
${/} - shorthand for ${pathSeparator}

```


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
### P-cores & E-cores are NOT performing well on NEK5000
Even by setting the followings, Nek is unstable on running over 26 or more cores. Need to find a way to stable run on 32 threads for test!
```
mpiexec --oversubscribe
or
mpiexec --use-hwthread-cpus
```
### Warning shown when running OPENMPI
>hwloc/linux: Ignoring PCI device with non-16bit domain. Pass --enable-32bits-pci-domain to configure to support such devices (warning: it would break the library ABI, don't enable unless really needed).

Tried: uninstall openmpi and build from [openmpi source](https://www.open-mpi.org/faq/?category=building#easy-build).
Warnings disappears.
### Wayland is not working well
开机切换到wayland，进入桌面开始卡顿，暂无探索解决办法，切换回x11工作正常

### Local libslatec.a is not working well
paraview显示错误的边界条件，将nt上的slatec包下载好后重新编译解决该问题。
### Zotero: too high contrast with Breeze Dark Theme
```
cd ~./local/share/application
vim zotero.desktop
Exec=env GTK_THEME=Default bash -c "............
```
### 怎么提取文件中的某些行,并绘图：
```
awk '!seen[$0]++' 文件名 > 新文件名

or

awk '/energy/ && !seen[$0]++' outfile > energy.his
```
```
plot "file.txt" every 10::100 using 5:4 with lines
```
### Default fan speed is noisee in linux
refer to [OpenFreezeCenter](https://github.com/YoCodingMonster/OpenFreezeCenter), which is good.
EC Fan speed points vs Temporature curve(could be cpu package temp)
| CPU |     |     |     |     |     |     |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|P1   |P2   |P3   |P4   |P5   |P6   |P7   |
|-?   |?-45?|?-55C?|?55C-?|?-?|70C-?|?-|

| GPU |     |     |     |     |     |     |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|P1   |P2   |P3   |P4   |P5   |P6   |P7   |
|-?|?-?|?-?|?-?|?-?|?-?|?-|
### 在Womersley 流动中，如何从reci.his判断流动已经收敛到稳态？
```
自行修改start和start+x的数值
start=6; while awk "NR>=$start && NR<=$start+3" reci.his; do start=$((start + 400)); done
```
### Kubuntu桌面在删除系统python3之后无法载入：
```
进入tty1 命令行模式：
nmtui 来启动简单图形页面的wifi网络连接器
sudo apt update
sudo apt install python3
sudo apt install --reinstall kubuntu-desktop
启动后可以进入tty7（图形界面）但无法使用鼠标键盘
sudo apt install xserver-xorg-input-all
某些以来系统python的包在运行sudo apt autoremove后丢失，需要重新安装
```
### Nek5000的P bc在element比较少时候无法启动(至少3层是无法启动，4层可以)，报错：
```
    0  ERROR:  Vanishing Jacobian near      2th node of element         5.
   5.1923076878325298E-003  -2.4692660769353551E-003


    1  ERROR:  Vanishing Jacobian near      2th node of element         4.


    2  ERROR:  Vanishing Jacobian near      2th node of element         1.


    3  ERROR:  Vanishing Jacobian near      3th node of element        18.
   1.8550712909060595E-002  -5.0360301079851247E-003

```
解决方法：加密P方向的element numnber
### 添加atzlinux “”铜豌豆linux”的keyring和源后运行apt update会覆盖原生ubuntu系统更名为atzlinux并尝试修改grub导致windows无法启动
临时解决方案, 使用boot-repair修复系统grub, sudo apt reinstall base-files 修复原生系统
```
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install -y boot-repair && boot-repair
```
### vscode : fortls wont launch
```
[ERROR - 13:59:57] [lsp.client] Unable to launch LS to check version:
[ERROR - 13:59:57] spawnSync /home/fanrui/.local/bin EACCES
Error: spawnSync /home/fanrui/.local/bin EACCES
	at Object.spawnSync (node:internal/child_process:1117:20)
	at spawnSync (node:child_process:914:24)
	at n.FortlsClient.getLSVersion (/home/fanrui/.vscode/extensions/fortran-lang.linter-gfortran-3.4.2024041503/dist/extension.js:1:67693)
	at n.FortlsClient.didOpenTextDocument (/home/fanrui/.vscode/extensions/fortran-lang.linter-gfortran-3.4.2024041503/dist/extension.js:1:64493)
```
临时解决办法：在modern fortran设置中指定 /home/fanrui/..../fortls 二进制文件explicitly 来绕过vscode检查不到PATH中的fortls的情况。
