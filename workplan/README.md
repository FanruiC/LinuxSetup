# Work Plan
## Templates
$\ce{Hg^2+ ->[I-] HgI2 ->[I-] [Hg^{II}I4]^2-}$

$$H(D_2) = -\left(\frac{2}{4}\log_2 \frac{2}{4} + \frac{2}{4}\log_2 \frac{2}{4}\right) = 1$$
      
$$
  \begin{pmatrix}
  1 & a_1 & a_1^2 & \cdots & a_1^n \\
  1 & a_2 & a_2^2 & \cdots & a_2^n \\
  \vdots & \vdots & \vdots & \ddots & \vdots \\
  1 & a_m & a_m^2 & \cdots & a_m^n \\
  \end{pmatrix}
$$

$$
q_{i}^{T} q_{j}=\left\\{
\begin{matrix}
0, i\ne j \\
1, i =  j \\
\end{matrix}
\right\\}
$$

## 15 Nov 23
Previous:
- [ ] DMD, SVD introduction
- [ ] Barkley_Blackburn_Sherwin , Direct optimal growth analysis for timesteppers.
2
Current:
- [ ] Complete dynamical system course: [微分方程和动力系统 Differential Equations and Dynamical Systems]( https://www.bilibili.com/video/BV13e411N7Vt/?p=32&share_source=copy_web&vd_source=c7625a8fd7a15d5783e3cc2650543d45)
- [ ] Review, Fluid Mechanics
- [ ] Read, Erik Bostrom, Investigation of outflow boundary conditions for convection-dominated incompressible fluid flows in a spectral element framework

## 18 Nov 23
- [ ] 11/136 Complete Openmichigan: [Lectures on Continuum Physics](https://open.umich.edu/find/open-educational-resources/engineering/lectures-continuum-physics)
- [ ] Review, [Interactive Linear Algebra](https://textbooks.math.gatech.edu/ila/index.html)
- [ ] Complete, [麻省理工学院 - MIT - 线性代数 我愿称之为线性代数教程天花板](https://www.bilibili.com/video/BV16Z4y1U7oU/?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=87f333e21626c3c3bbbb43b6711d2d81)
---
 ### Gilbert Strang Linear Algebra Contents:
- Lec 1: Row Picture (画图求交点，直接看出结果) / Colume Picture （画向量，估计可能的线性组合得到目标向量）
- Lec 2:
  - Gauss elimination matrices. 一个矩阵右乘和左乘 向量/矩阵 的区别 (左：行的线性组合得到新的行；右：列的线性组合得到新的列).
  - Permutation Matrices. How many?
  - 初等 Elimination matrices 的逆非常好求 
- Lec 3:
  - Four ways to do matrix multiplication: 单个元素/行法/列法/分块法
  - Inverses: why 一个矩阵没有逆？两种令人启发的解释
  - 求逆和解一系列的线性方程组一致，we're back to Gauss, and Jordan comes in. E[A I] = [EA EI] = [I A^-1]
- Lec 4:
  - A,B are invertible, (AB)的逆等于什么？ What's the inverse of A transpose?
  - If A is invertible, and no permutation matrice is needed, then EA = U, and E is lower triangular, then A = LU
  - LU = LDU, 一种行乘的理解迅速分解U求出DU
  - Lower triagnal means we are doing minus only row by row to the bottom. Why A=LU is better than EA=U? Try on a 4x4 example.
  - How many operations for LU decomposition for computer?
  - How many permutation matrices for a nxn square matrix? Answer: A(n,n)
- Lec 5:
  - Inverse of a permutation matix is it's transpose.
  - R 和 R 的转置相乘总能得到对称矩阵。
  - Defination of subspaces.
- Lec 6: From definition to algorithm
  - Column subspace of A in R(m). Ax=b 有解的条件
  - Null subspace of A in R(n).
  - Ax=b 的解构成子空间吗？
- Lec 7: Solving Ax=0
  - row echelon form, Solving Ax=0, Pivots columns, Free columns. Pivot variables and Free variables. 通解是由free variable 个数的特解的线性组合构成的。
  - reduced row echelon form (RREF), 分块矩阵I,F用于快速求解特解（Null space's basis）！
- Lec 8: Solving Ax=b
  - Solvability condition on b: Ax=b solvable when b in C(A) 等价于 If a conbination of rows of A gives 0 rows, then same combination of entries of b must give 0.
  - Particular solution by setting free variables to 0.
  - If I have a particular solution xp, I can add this vector with any vectors in null space, xn, the right hand side wouldn't change.
  - m, n, r relation. Full column rank, Full row rank. RANK tells everything about the number of solutions.
       |r=m=n|r=n<m|r=m<n|r<m,r<n|
       |:---:|:---:|:---:|:---:|
       |1 solution|0 or 1 solution|infinite solution|0 or infinite solution|
- Lec 9: Basis, Dimension, independency
- Lec 10: Four subspaces that come from a matrix A(m x n) with rank r
  - |Name     |Column Space C(A)|Null Space N(A)|Raw Space C(AT)|LeftNull Space N(AT)|
    |:---:    |:---:            |:---:          |:---:                            |:---:               |
    |In       |R(m)             |R(n)           |R(n)                             |R(m)                |
    |Dimension|r                |n-r            |r                                |m-r                 |
    |Basis    |Pivot Cols       |Special solu's |Pivot Rows / First r rows of rref|EA = R, through E   |
      
  - 广义的 Vector Spaces
- Lec 11: Rank 1 matrices
  - Rank 1 matrices are the building blocks for big matrices. Can be written as the multiplication of a col vector times row vector.
- Lec 12: Skip
- Lec 13: Skip
---
- Lec 14: Orthogonal subspaces, basis, vectors. 90 degrees.
  - (xT)(y) = dot product = 0 : x and y are orthoganal vector.
  - Row space is orthogonal to null space, why? Think about orthogonal definition: dot product of 2 vectors equals 0.
  - Nullspace and rowspace are orthogonal COMPLEMENTS in R(n) 等价于 Nullspace contains ALL vectors perpenticular to rowspace.
  - Idea of "best solve" Ax=b when there is no solution.
  - The importance of $A^TA$
- Lec 15: IMMORTAL
  - Projections: $\mathbf{p}=\mathbf{a}\frac{\mathbf{a^T b}}{\mathbf{a^T a}}$
  - Projection Matrix: $\mathbf{p} = P \mathbf{b}$, $P=\frac{\mathbf{aa^T}}{\mathbf{a^T a}}$
    - C(P) is the line through a, Rank(P)=1
    - P is symmetric
    - $P^2=P$
  - Why project? Because Ax=b may have no solution, we solve Ax=p where p is the the projection of b onto the Col space.
  - The Projection Matrix for high dimention
- Lec 16:
  - Least Squares: $A^T Ax = A^T b$, 大前提：A is Column Full Rank.
  - Definition of ORTHONOMAL VECTORS: a set of unit vectors that are perpendicular to each other
- Lec 17:
  - Orthogonal basis: $q_{i}^{T} q_{j}=(0, i\ne j\ or\ 1, i=j)$
  - Orthogonal matrix: $Q^T Q=I$, specially for unknown reason, Q is by default square matrix and Q's columns are unit vectors. So $Q^{-1} = Q^T$.
    好处：如果A的列向量是orthonomal vecotrs, 则投影到A的Projection Matrix $P=QQ^T$. And this way: $x_{leastsquered} = Q^T b$, which means: $x_i = q_i^T b$
  - Graham and Schmidt: A=QR, 是QR分解的基本技术，数值上有多种更优秀的QR分解算法。
- Lec 18：Determinant, for eigenvalues.
  - Properties: 
    - det(I)=1
    - Row exchange reverse the sign of det(A)
    - subtract l x row(i) from row k doesn't change det(A)
    - Zero row means det(A)=0
    - det(AB)=det(A)det(B)
    - $det(2A)=2^n det(A)$
    - $det(A)=det(A^T)$
- Lec 19: Determinant Calculation using cofactors.
- Lec 20: Determinant Application
  - $x=A^{-1}b=\frac{1}{det(A)}C^T b$ Cramer rules, 中看不中用
  - det(A) Its absolute number is the volume of the "box", its sign says it's a right-handed box or a left-handed box
- Lec 21: Eigenvalues-Eigenvectors
  - $Ax = \lambda x$, N-order square matrix must have n eigenvalues.
  - $det(A-\lambda I)=0$
  - $Ax=\lambda x$ and $(A+3I)x=(\lambda + 3)x$
- Lec 22: Diagnal, Power
  - 差分方程！非波那且数列
- Lec 23：
  - 微分方程！复指数
  - 2 dimension 系统的稳定性部分解读。
  - 线性动态系统解耦
- Lec 24：
---
- [ ] Gilbert Strang 同时教授[这些课程](https://ocw.mit.edu/search/?q=Prof.+Gilbert+Strang)
## 20 Nov 23
- [ ] Learning Paraview visulisation techs.
- [ ] Reading literatures and decide the structures of the upcoming paper and the structures of the presentation slides, as well as the structures of upcoming simulations to do.<br>
      Three typical papers are: (Hufnagel et al. 2018) (Pier & Schmid 2017) (Lupi et al. 2020)
- [ ] Luchini / Bottaro , Adjoint equation in stability analysis.
- [x] Rebuild 3D model of the bent pipe including script. Done.
- [x] Running Re550, 94080 elements case
## 21 Nov 23
- [ ] Learning, Resovent Modes
- [ ] Reading, Drazan, Hydrodynamical Stability
## 23 Nov 23 Justin Meeting
- [ ] Tracking perturbation evolution at bend entrance and exit together with time. Plot the results. See [Justin's notes for me](https://github.com/FanruiC/LinuxSetup/blob/main/workplan/Fanrui.pdf)
### Ideas for uncoming work:
- [ ] Changing STROKE NUMBER, especially for large numbers
- [ ] Look at the stability of secondary modes, requires a stablisation algorithm.
- [ ] Test on rough mesh for parameter analysis first then apply to fine mesh.
- [ ] Investigate the influence of forced Womersley BCs on flows at bend. Especially when Re is high and probabally need a longer straight section.
- [ ] Investigate the influence of using a Sponge at both inlet and outlet, checking for any difference occurs at bend.
## 26 Nov 23
- [x] Steam 秋促购买
- [x] 行李箱x2
- [x] 购买保健品
- [x] 侯叔叔，琳爸妈爷奶，others
- [x] 购买电话卡
- [x] 租房选择
## 28 Nov 23 Justing Richard Meeting
- [ ] A/D could be from small to large eg. 0.1 - 10
- [ ] Relationship to $Re_\delta$
  - Re_max, Re_omega, Re_delta are related to each other. Only two independent dimensionless parameter needed.
- [ ] Poincare map
- [ ] Quasiperiodic?
- [ ] Standing waves, traveling waves in fluids?
- [ ] Richard: High order modes don't feed back? Absorbing low frequency energy?
  - By running linear stability, we ignore any non-linear(High order terms, high order modes), we've got a low frequency mode(f=0.022), it may have potential to used as absorbing long period wave energy in ocean.
- [ ] Running stabnek by:
  - start from snapshot 100, the start from 110, 120,... we expect a mode structure change. Eigenvalue and eigenvectors are not changing. But the leading mode has a phase, and we are extracting its real part so it woud change.

## 29 Nov 23
- [ ] Nek里的eigenvalue和微分方程里的eigenvalue如何转变？
- [ ] Learn how OFC controls the linux FAN speeds.
## 08 Dec 23 Justing Meeting ACCM Preparation
Notes and inspirations:
- Something called the Rehynolds Orr equation will tell you regions of where you would expect to see perturbation growth.
> Okay, this is what we've found. You can see where the mode is growing, and it's focused in these regions. Those regions correspond with these big Dean vortices that are coming from the centripetal instability. And what we're finding is that it's not synchronous. So there's a deviation in the flow that causes a second frequency at a much lower frequency. So it repeats it over eight cycles. If we look at that over sampling once per period, we can see that the structure is slightly shifting. I think that's basically it. The only thing that you would add to that, I guess, is some description of what would you expect to see then. What is that predicting? I guess it's saying, well, what you would predict to see is that the periodic flow first loses stability to a low frequency. Either growth and decay, or there's some kind of slow sloshing backwards and forwards. 
> now that you've got a nice, an idea of what the mode structure looks like. So you take that mode, the linear mode, the leading linear mode at a certain phase. You pick a magnitude. So remember the magnitude is, the absolute magnitude is arbitrary. Yes. But you pick one. Yeah. And a good one might be to say, all right, well let's make the magnitude such that the maximum perturbation velocity is maybe one order of magnitude smaller than the maximum base flow velocity. So if the base flow is moving at a velocity of about one, then we'll make it such that the perturbation has a magnitude of about 0.1. So that's pretty big. Then we'll add the perturbation to the base flow as an initial condition. Yeah. So what we should be doing is basically providing the mode that is going to grow the fastest, like directly to the DNS and letting the DNS evolve that flow. So if it's unstable, you would expect, or I would expect if it's unstable, that that would trigger the mode to grow. That would really push the solution away from the equilibrium or away from the fixed point. And it should go to do something else.

> As I said, and then, you know, a slide at the end if you wanted to about, okay, where is this going? Would you make a DNS confirmation that we see or see something similar? And also the parameter study of, okay, let's vary the amplitude and potentially the geometry.

> I'm always thinking about, okay, where could we be criticized? What could we have missed? What could people say? And I guess one thing that they might sort of say is, oh, look, that frequency is really low. Maybe it's supposed to be zero. You know, maybe the frequency is trying to become, you know, it's a real, it's a mode that's actually synchronous. But I don't think that's the case, right, because the actual values of the Floquet multipliers that you calculate, the complex components aren't near zero, are they? They're quite large. So, yeah, so I think it's looking good. Yeah, is it good to present the evolution of the perturbation field or not necessary? Yeah, look, it's up to you. If you think you've got time, then I would show it, yeah. I found out a phenomenon here. This is the perturbation evolution. It is similar to the leading mode we get at time zero. But at time, the next same phase of the next cycle, we get. It changes a lot. It changes a lot. But, yeah, it changes a lot. And until we get, yeah, it changes quite a lot. And until we get 115, that is 15th cycle, it comes back. Almost exactly where it was, but bigger. Yeah, but bigger. Because it's growing. So what you could do is renormalize each frame to take the growth away, just to see the variation over time.

- [ ] Build Stabilization tools for solving base.
## 09 Dec 23
- POD, DMD, SVD, FFT from Justin's signal processing course.
- My ChatGPT-Next was deployed on [Vercel](https://vercel.com), domains on [Namesilo](https://www.namesilo.com)
## 14 Dec 23
- tested a new 2d cyl model with new mesh, the nekmodes.py seems not working at all for this case, need to check and find out the difference between Floquet and Simple Linear Stability Analysis.
## 07 Feb 24
## 22 Feb 24
- Joint paper for International Conference on Ocean Energy, Richard & Justin
## 28 Feb 24
- Property Inspections
  - [x] 29th Thu 9:30am 29/168 Power st. Hawthorn type: 211 Buxton $625
  - [ ] 29th Thu 2:30pm 10/578 Glenferrie Rd. Hawthorn type: 211 JellisCraig $525 Realestate/Tenantapp
  - [x] 2nd Sat 12:00pm 102/7 Montrose st. Hawthorn east type:?
  - [ ] 2nd Sat 11:00am 308/9 Montrose st. Hawthorn type: 111 A/real $525 Realestate/Tenantapp
  - [x] 2nd Sat 10:00am 205/8 Queens Ave. Hawthorn type: 111 A/real $525 
  - [ ] 2nd Sat 9:30am 29/168 Power st. Hawthorn type: 211 Buxton $625 Realestate
  - [ ] 2nd Sat 12:15am 41/589 Glenferrie Rd. Hawthorn type:?
  - [ ] 5nd Tue 12:00pm 506/25 Lynch st. Hawthorn type:?
- Property applied
  - [x] Snug: 401/1 Cook Street, Hawthorn. 111 $550
  - [x] 2apply: 203/1A Launder St. Hawthorn. 211 $575 Woodproperty
## 01 Mar 24 Meeting with Justin Minutes
Stabilising periodic orbits  
$\frac{\partial \mathbf{u} }{\partial t} = -(\mathbf{u}\cdot\nabla)\mathbf{u} - \nabla P + \frac{1}{Re}\nabla^{2}\mathbf{u}+\mathbf{Ac}$  
$Ac = \Gamma (\mathbf{u}^{t-T} - \mathbf{u}^{t})$  
Tests on a smaller non-linear system: two duffing oscillators coupled via a linear spring:
> The Duffing oscillator is a non-linear second-order differential equation that describes the motion of a damped oscillator with a more complex potential than in simple harmonic motion (i.e., it includes a non-linear restoring force). When we have two such oscillators coupled by a linear spring, the equations of motion become more complex due to the interaction between the two systems. The equations of motion for two coupled Duffing oscillators can be written as:
> 
> $\ddot{x_{1}}+ \delta\dot{x_{1}}+ \alpha x_{1}+ \beta x_{1}^3+ k(x_{1}-x_{2}) = \gamma cos(\omega t)$
>
> $\ddot{x_{2}}+ \delta\dot{x_{2}}+ \alpha x_{2}+ \beta x_{2}^3+ k(x_{2}-x_{1}) = \gamma cos(\omega t)$
## 26 Mar 24
- [x] Reorganize the desktop and import data from the old laptop
- [ ] Summarize learing progress and organize study materials
- [x] Finalise house moving stuff- change address, documentations.
## 18 Apr 24
- Time-dalayed-feedback fortran programming finished in the form of a fortran module.
- Start reseaching on Mesh Independence in CFD. Refer to video by [Cillian Thomas](https://www.youtube.com/watch?v=Bzr35PLVupA&t=459s) on GRID CONVERGENCE INDEX METHOD by JFE- Journal of Fluids Engineering Editorial Policy Statement on the Control of Numerical Accuracy
- [ ] Try GCI method on Nek.
- [ ] Re-set-up Setonix.
- [ ] paraview systemetic study
- [ ] visit study?
- [ ] gnuplot sytemetic study
> These are visualisation method study, which is very important as it is an way of communication
- Pawsey Setonix Tricks
  - sacct: show details of past jobs.
  > The standard output and error streams are redirected to a file named slurm-<jobID>.out
  - module avial
  - host name
  - ssh -X -C setonix
  - scontrol(hold) / scontrol(release)
  - scontrol show job JOBID !this is the subcommand of scontrol
  - [ ] recursive run on Setonix? [here](https://pawsey.atlassian.net/wiki/spaces/US/pages/51925946/Example+Workflows)
  - [ ] python developing on Setonix? [here](https://pawsey.atlassian.net/wiki/spaces/US/pages/51925944/Developing+with+Python)
  - [ ] Compiling optimisation options [here](https://pawsey.atlassian.net/wiki/spaces/US/pages/51925954/Compiling)
  > $MYSCRATCH $MYSOFTWARE $PAWSEY_PROJECT
  
- Try vscode on setonix [here](https://pawsey.atlassian.net/wiki/spaces/US/pages/51931360/Visual+Studio+Code+for+Remote+Development)
  > Avoid using vscode for ssh setonix cause potential issues [here](https://pawsey.atlassian.net/wiki/spaces/US/pages/51931360/Visual+Studio+Code+for+Remote+Development)
- Three pawsey programming envs:   
  $ module swap PrgEnv-gnu PrgEnv-aocc  
  $ module swap PrgEng-aocc PrgEnv-cray  
  $ module swap PrgEnv-cray PrgEnv-gnu
- Setonix Slurm Scripts Examples:
```
#!/bin/bash -l
#SBATCH --account=<project>
#SBATCH --partition=work
#SBATCH --time=24:00:00
#SBATCH --nodes=2
#SBATCH --job-name=lammps-job
 
module swap PrgEnv-cray PrgEnv-gnu
module load lammps/20210929.3
 
srun --export=all -n 48 lmp_mpi -in lammps.inp -log lammps.log
```
## 19 Apr 24
- [ ] Build TDF module to add check converging function
- [ ] Function of Checking residual in DNS
- [x] Profiling using gprof on setonix [here](https://pawsey.atlassian.net/wiki/spaces/US/pages/51925992/Profiling+with+gprof)
      
      add -pg in makenek fflags, then run the code, then run: gprof nek5000 gmon.out > nek5000.txt
## 20 Apr 24
- [ ] Learn some Error analysis in data science for checking stable flow or not
- [ ] Learn 数值分析！，包括数值积分，数值微分，数值离散，离散数学，各种数值解法
- [ ] What is erro norm? In nek it's normvc() subroutine
## 21 Apr 24
- [ ] Talking with Justing on normvc subroutine of Nek: BM1, semi, H1, L2 norms
```
      KE = glsc3(vx, vx, bm1, lx1*ly1*lz1*nelv) + 
     $ glsc3(vy, vy, bm1, lx1*ly1*lz1*nelv) +
     $ glsc3(vz, vz, bm1, lx1*ly1*lz1*nelv)
      Ke = Ke/2.D0
```
are used to calculate the total kenetic energy of the entire fluid domain. BM1 is the mass matrix, which could be considered as the  mass of the controled volume nearby a certain gll point. if pho is constant, then mass matrix can be seen as the controlled volumes of a certain gll point.
- [ ] Review energy flow in CFD. 重新理解energy守恒在CFD中
## 22 Apr 24
Justin meeting notes: fft on reci.his to determine the minimam freq needed to resolve every feature. Using spyder history:
```
import numpy as np
import matplotlib.pyplot as plt
data = np.loadtxt('temp.dat','r')
data = np.loadtxt('temp.dat')
F = np.fft.fft(data[:,1])
freq = np.linspace(0,1/(data[0,1]-data[1,1]),np.size(data)[0])
np.size(data)
freq = np.linspace(0,1/(data[0,1]-data[1,1]),np.shape(data)[0])
plt.semilogy(freq,np.abs(F))
freq = np.linspace(0,1/(data[1,1]-data[0,1]),np.shape(data)[0])
plt.semilogy(freq,np.abs(F))
freq = np.linspace(0,1/(data[1,0]-data[0,0]),np.shape(data)[0])
plt.semilogy(freq,np.abs(F))
plt.semilogy(freq,np.abs(F)/np.max(np.abs(F)))
F = np.fft.fft(data[:,1]-np.mean(data[:,1])
)
plt.semilogy(freq,np.abs(F)/np.max(np.abs(F)))
import scipy
w = scipy.signal.tukey(np.shape(data)[0], 0.1)
F = np.fft.fft((data[:,1]-np.mean(data[:,1]))*w)
plt.semilogy(freq,np.abs(F)/np.max(np.abs(F)))
plt.plot(data[:,0], data[:,1])
plt.plot(data[:100,0], data[:100,1])
```
## 25 Apr 24
- [ ] Feyman Torque, angular momentum
> 圆周运动加速度怎么推导？思路非常重要。1.如果
- [ ] Tensor Computation in Fluid Mechanics
- [ ] Energy dissipation rate
- [ ] Kolmogorov Scales
## 29 April 24 刚体动力学，from Feyman lectures
1. 质心本质是一个位置向量，是以刚体上各个质点位置为向量和，质点质量为权重的加权平均。
> 我们将在以后的章节中更详细地讨论这个重要的定理，因此我们将限制我们的评论在两个方面：首先，如果外力为零，如果物体在空旷的空间中漂浮，它可能会旋转、摆动、扭曲，以及做各种各样的事情。但质心，这个人为发明的、计算出的位置，在中间的某个地方，将以恒定的速度移动。特别是，如果它最初处于静止状态，它将保持静止。因此，如果我们有某种盒子，也许是一艘宇宙飞船，里面有人，我们计算质心的位置，并发现它静止不动，那么如果盒子上没有外力作用，质心将继续保持静止。当然，宇宙飞船可能在空间中稍微移动，但那是因为人们在里面来回走动；当一个人向前走时，飞船向后移动，以便保持所有质量的平均位置恰好在同一个地方。
2. 二维空间中，某瞬时时刻，某绕某轴（曲率中心），旋转的质点P，  displacement position 位置（x,y），angular position ($\theta$);  速度（vx, vy) 角速度 $\omega$ 。displacement 和 angular movement之间有什么关系呢？线位置的微分 $\delta x$ , $\delta y$ 和 角位置的微分 $\delta \theta$ 有如下关系：

$\delta x = -y \delta \theta $

$\delta y = +x \delta \theta $

即 横坐标位置越远，纵坐标瞬时变化越大； 纵坐标位置越远，横坐标瞬时变化越大。两边各自除以时间的微分 $\delta t$ 得到线速度和角速度之间的关系：

$vx = -y \omega$

$vy = +x \omega$

> In order to study rotation, we observe the angle through which a body has turned. Of course, we are not referring to any particular angle inside the object itself; it is not that we draw some angle on the object. We are talking about the angular change of the position of the whole thing, from one time to another.

在某瞬时， 质点如果受力可以分解为Fx， Fy，那么微小时间段内，力所做的功为：  
$W = Fx * \delta x + Fy * \delta y$  
如果我们在角位移，角速度的，转动的视角下审视问题: 前提如果是绕轴旋转运动，功在旋转的视角下就变为一个新的“力”与角位移的乘积，这个整合出来的“力”就是转矩。  
$W = Fx * (-y*\delta \theta) + Fy * (x*\delta \theta)$

$W = (x Fy-y Fx) * \delta \theta$  
3. 空间中以刚体，如果处于平衡状态，为什么合力和合力矩必须都为零？
> 答：平衡状态意味着受力，受力矩，但不运动，能量是守恒的，没有外界输入的功或输出的功。因此我们假设有一小段位移，每个力，每个力矩所做的功就必须相抵消，不然就会产生净功输入/输出，破坏能量守恒。所以F合必为0，不然质心就会displacement运动，产生净功。 当F合为零时， 不论选取空间中任何一点，合扭矩永远为CONSTANT，因此刚体必然转动，那么转动轴在哪里呢？转动轴不能为任意，因为如果转轴不包含质心，那么质心就会做绕轴转动，与F合为零矛盾！！！，因此前提合外力为零时，即使合力矩不为零，发生转动，转轴也必过质心！！！ F合为零只能保证质心不会被加速/减速产生功，但不能细致到刚体上的每一个质点，实际上，刚体可以在合力矩不为零的情况下持续累积转动带来的动能。做工如下：
>
> $\Delta W = \tau_{total}\Delta\theta$
>
> 只有当合力矩也为零时，刚体才不会转动加速/减速产生功。从而能量守恒，达到平衡状态。
4. 一切都是从**质点**在**某一瞬间，绕曲率半径R**转动时候受力做功开始推导起的。首先最直观，功 = Fx*dx + Fy*dy,然后通过dx，dy和 d角度的关系，得到角度下的功关系式并定义扭矩：功 = (xFy - yFx) * 角度位移，再然后，通过作图发现只有切向力会产生功，因此：功 = Ft * R*角度位移；那么自然而然： 扭矩 = Ft * R = F*sin(a)*R， 其中a是力和P点位置矢量的夹角。 因此扭矩还有第三种公式：把sin(a)给R来计算分量，得到 扭矩 = F * (R *sin(a)) 叫做 THE LEVER ARM OF THE FORCE. TORQUE IS ALSO CALLED THE MOMENT OF FORCE.
5. 角动量 ANGULAR MOMENTUM
> 有一团粒子，合外力决定了什么？合外力决定了这团粒子的总动量P总的变化率。F外 = F合 = p1/dt + p2/dt + ... + pn/dt
> 也可以**假设的等价为一个质点，在质心位置，具有总质量M**的P的变化率。 F外 = F合 = p(MV)/dt
> 两者在等价关系上是一致的，一团粒子无论其内部粒子如何受力，如何互相运动，旋转，扭动，其质心的动量永远可以用上式来预测。正如之前的飞船例子所描述，“如果外力为零，如果物体在空旷的空间中漂浮，它可能会旋转、摆动、扭曲，以及做各种各样的事情。但质心，这个人为发明的、计算出的位置，在中间的某个地方，将以恒定的速度移动。特别是，如果它最初处于静止状态，它将保持静止。因此，如果我们有某种盒子，也许是一艘宇宙飞船，里面有人，我们计算质心的位置，并发现它静止不动，那么如果盒子上没有外力作用，质心将继续保持静止。当然，宇宙飞船可能在空间中稍微移动，但那是因为人们在里面来回走动；当一个人向前走时，飞船向后移动，以便保持所有质量的平均位置恰好在同一个地方。”
> 
> 但是除了质心之外的质点该如何运动呢？如果我们研究刚体，则大大简化，就好像宇航员，物品全部冻结在飞船的某个位置，形成刚体一样。当合外力为零时候，the total momentum of a collection of particles is 0， 但这并不意味着所有粒子都不运动，恰恰相反，所有粒子都在绕一个穿过质心的轴转动，每个粒子都有自己的动量，且动量还在不停转变方向，只不过在计算合动量时候，total momentum全部抵消掉了而已。既然合动量为零（或不变）， 那我们如何描述这种旋转的程度呢？我们首先从**一个粒子**开始：

> $F_x = \frac{d(mv_x)}{dt} $
> $F_y = \frac{d(mv_y)}{dt} $  
> 力用来衡量动量的变化率
> 那扭矩用来衡量什么的变化率呢？假设这个未知东西用 L 表示  
> $xF_y - yF_x = \frac{d(L)}{dt}$； 下面找到这个L，把Fx,Fy用动量式子替换，得到  
> 发现这个L恰恰是 $xmv_y - ymv_x$, 即 $L = xP_y - yP_x$ 称作角动量（在某一瞬时时刻，绕曲率半径为R的旋转轴！）。

> 也就是说，**这个粒子**所受的**外力**改变了其**动量**  
> 同时，选取**转轴处这一点**，**这个粒子**所受的**外力**对这一点产生了**合扭矩**改变了其**相对于这一转轴点**的**角动量**。

> 虽然我们目前的讨论是非相对论的，但上述给出的角动量 𝐿 的第二种形式是相对论正确的。因此，我们发现了动量的旋转类比，即角动量，它是由线性动量分量的表达式给出的，其形式与扭矩的力分量的公式非常相似！因此，如果我们想要知道一个粒子关于一个轴的角动量，我们只需要考虑动量的切向分量，并将其乘以半径。换句话说，对于角动量而言，重要的不是它离开原点的速度有多快，而是它围绕原点的运动有多少。只有动量的切向部分才对角动量有贡献。此外，动量线的延伸越远，角动量就越大。并且，由于几何事实是相同的，无论数量标记为 𝑝 还是 𝐹, 都存在一个杠杆臂（不同于粒子受力的杠杆臂！），它是通过延长动量线并找到到轴的垂直距离得到的。因此，角动量是动量的大小乘以动量杠杆臂。因此，我们有三个关于角动量的公式，就像我们有三个关于扭矩的公式一样.  
> $L = xp_y - yp_x = rp_{tangent} = p*lever arm$



