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
- Lec 2: Gauss elimination matrices. 一个矩阵右乘和左乘 向量/矩阵 的区别 (左：行的线性组合得到新的行；右：列的线性组合得到新的列).
- 
-  
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
