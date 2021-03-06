function g = wienerKernGradient(kern, x, varargin)

% WIENERKERNGRADIENT Gradient of WIENER kernel's parameters.
% FORMAT
% DESC computes the gradient of functions with respect to the
% wiener
% kernel's parameters. As well as the kernel structure and the
% input positions, the user provides a matrix PARTIAL which gives
% the partial derivatives of the function with respect to the
% relevant elements of the kernel matrix. 
% ARG kern : the kernel structure for which the gradients are being
% computed.
% ARG x : the input locations for which the gradients are being
% computed. 
% ARG partial : matrix of partial derivatives of the function of
% interest with respect to the kernel matrix. The argument takes
% the form of a square matrix of dimension  numData, where numData is
% the number of rows in X.
% RETURN g : gradients of the function of interest with respect to
% the kernel parameters. The ordering of the vector should match
% that provided by the function kernExtractParam.
%
% FORMAT
% DESC computes the derivatives as above, but input locations are
% now provided in two matrices associated with rows and columns of
% the kernel matrix. 
% ARG kern : the kernel structure for which the gradients are being
% computed.
% ARG x1 : the input locations associated with the rows of the
% kernel matrix.
% ARG x2 : the input locations associated with the columns of the
% kernel matrix.
% ARG partial : matrix of partial derivatives of the function of
% interest with respect to the kernel matrix. The matrix should
% have the same number of rows as X1 and the same number of columns
% as X2 has rows.
% RETURN g : gradients of the function of interest with respect to
% the kernel parameters.
%
% SEEALSO wienerKernParamInit, kernGradient, wienerKernDiagGradient, kernGradX
%
% COPYRIGHT : Neil D. Lawrence, 2009

% GPMAT

if nargin < 4
  [K, sk] = wienerKernCompute(kern, x);
else
  [K, sk] = wienerKernCompute(kern, x, varargin{1});
end
g(1) = sum(sum(varargin{end}.*sk));
