clc
clear all
dataloc = 'C:\Users\guslindw\Documents\MATLAB\Forskning, höst 2021\Datasets\';
load(strcat(dataloc,'dataset_20211122_1357')) % or some other dataset

% hyperparameters
dx = 0.01;
A  = 4;
agents = cell(A,1);
for a = 1:A
    theta     = 10*rand(2,1);
    agents{a} = struct('sigma',NaN,'loc',theta,'v_a',...
        10^(-3)*10*rand(2,1),'fitness',NaN,...
        'best_loc',10*rand(2,1),'best_fit',-Inf);
end
%% priors
alpha0 = 0;
beta0  = 0;
for a = 1:A
    theta = agents{a}.loc;
    [alphaK,betaK] = diffusion_shell(observed_cells,theta,dx,alpha0,beta0);
    agents{a}.sigma = sqrt(betaK./alphaK)';
end
