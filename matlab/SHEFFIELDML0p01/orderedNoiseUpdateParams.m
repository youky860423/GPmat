function [nu, g] = orderedNoiseUpdateParams(noise, mu, varsigma, y, index)

% ORDEREDNOISEUPDATEPARAMS Update parameters for ordered categorical noise model.
%
%	Description:
%	[nu, g] = orderedNoiseUpdateParams(noise, mu, varsigma, y, index)
%



[g, dlnZ_dvs] = orderedNoiseGradVals(noise, mu(index, :), ...
                                            varsigma(index, :), ...
                                            y(index, :));

nu = g.*g - 2*dlnZ_dvs;