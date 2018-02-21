function [result] = calculate_visibility_graph(time_series, max_range)
%VISIBILITY_GRAPH Summary of this function goes here
%   Function calculates visibility graph for given time series
%   Usage:
%   visibility_graph(time_series) - calculates visibility graph for maximal
%   possible range
%   visibility_graph(time_series, max_range) - calculates visibility graph
%   for maximal specified range
%   Detailed explanation goes here
%   
%   Result structure:
%   result.max_range - maximal range used for calculation
%   result.angle_vector(index) - vector or angles for each element
%   result.angle_vector(index).values - list of angles for all visible
%   neighbours


fprintf('[visibility_graph] Calculating visibility graph \n')
if ~(exist('max_range','var'))
    max_range = length(time_series);
end

result.max_range = max_range;

for i=1:length(time_series)
    fprintf('[visibility_graph] Calculating angles vector for element %d \n',i)
    counter = 1;
    for j=(-max_range):1:max_range
        if j == 0 || i+j < 1 || i+j > length(time_series)
            % do not check angle between return itself and do not go beyond
            % time series
            continue;
        end
        
        if is_visible(time_series,i,i+j)
            result.angle_vector(i).values(counter).val = tan((time_series(i)-time_series(i+j))/abs(j));
            result.angle_vector(i).values(counter).index = i+j;
            counter = counter+1;
        end
    end
end

end

