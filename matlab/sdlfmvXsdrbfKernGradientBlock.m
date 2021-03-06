function [g1, g2, g3] = sdlfmvXsdrbfKernGradientBlock(lfmKern, rbfKern, t1, t2, ...
    i, j, generalConst, generalConstGrad, covGrad)

% SDLFMVXSDRBFKERNGRADIENTBLOCK Gradients of the parameters in block i,j
% FORMAT
% DESC computes the kernel parameters gradients for the SDLFMXSDRBF kernel 
% function in the block specified at indeces i,j. Assumes the output system
% is a velocity.
% ARG lfmKern : structure containing parameters for the output system 
% ARG rbfKern : structure containing parameters for the latent system
% ARG t1 : times at which the system 1 is evaluated
% ARG t2 : times at which the system 2 is evaluated
% ARG i : interval to be evaluated for system 1
% ARG j : interval to be evaluated for system 2
% ARG generalConstant : constants evaluated with sdlfmKernComputeConstant.m
% ARG generalConstGrad : derivatives of the constants computed with
% sdlfmKernGradientConstant.m
% ARG covGrad : partial derivatives of the objective function wrt portion
% of the kernel matrix in block i,j
% RETURN g1 : gradients of parameters for the system 1
% RETURN g2 : gradients of parameters for the system 2
% RETURN g3 : gradients of switching points
%
% COPYRIGHT : Mauricio A. Alvarez, 2010.

% GPMAT

if nargin<7
    j = i;
    generalConst = [];
end

if i==j
    [g1, g2, g3t] = sdlfmXsdrbfKernGradientBlockIEJ(lfmKern, rbfKern, t1, t2, ...
        covGrad, {'lfmv', 'lfma'});
    g3(i) = g3t;
else
    [g1, g2, g3] = sdlfmXsdrbfKernGradientBlockIGJ(lfmKern, rbfKern, ...
        t1, t2, i, j, generalConst, generalConstGrad, covGrad, {'lfmv', 'lfma'});
end