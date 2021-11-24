clc, clear all
load dataset_20211123_1106.mat


theta  = [0.2 3];
dx     = 10^(-3);
alpha0 = 0;
beta0  = 0;

[alphaK,betaK] = diffusion_shell(observed_cells,theta,dx,alpha0,beta0);
boxplot(sort(sqrt(betaK./(alphaK))))


