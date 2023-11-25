# Work Plan
## 15 Nov 23
Previous:
- [ ] DMD, SVD introduction
- [ ] Barkley_Blackburn_Sherwin , Direct optimal growth analysis for timesteppers.

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
    -  Solvability condition on b: Ax=b solvable when b in C(A) 等价于 If a conbination of rows of A gives 0 rows, then same combination of entries of b must give 0.
    -  Particular solution by setting free variables to 0.
    -  If I have a particular solution xp, I can add this vector with any vectors in null space, xn, the right hand side wouldn't change.
    -  m, n, r relation. Full column rank, Full row rank. RANK tells everything about the number of solutions.
       |r=m=n|r=n<m|r=m<n|r<m,r<n|
       |:---:|:---:|:---:|:---:|
       |1 solution|0 or 1 solution|infinite solution|0 or infinite solution|
 - Lec 9: Basis, Dimension, independency
 - Lec 10: Four subspaces that come from a matrix A(m x n)
    - Column Space C(A) in R(m)
    - Null Space N(A) in R(n)
    - Raw Space C(AT) in R(n)
    - LeftNull Space N(AT) in R(m)
      |Four subspaces from matrix A(m x n)|
      |:---:|:---:|:---:|:---:|
       

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
