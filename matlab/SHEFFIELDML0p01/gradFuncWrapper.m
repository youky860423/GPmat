function [f, g] = gradFuncWrapper(x, func, grad, varargin)

% GRADFUNCWRAPPER Wrapper function to enable use of Carl Rasmussen's minimze function.
%
%	Description:
%	[f, g] = gradFuncWrapper(x, func, grad, varargin)
%

func = str2func(func);
grad = str2func(grad);
f = func(x', varargin{:});

if nargout > 1
  g = grad(x', varargin{:})';
end
