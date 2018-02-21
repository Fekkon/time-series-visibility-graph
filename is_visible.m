function [ value ] = is_visible(time_series, current_index, index_of_element_to_check)
%   IS_VISIBLE function checks if element at index_of_element_to_check is
%   visible from current_index of time series
%
%   Function applies definition from [1] as follows:
%   Two arbitrary data values (t_a, y_a) and (t_b, y_b) will have
%   visibility if any other data (t_c,y_c) placed between them fulfills
%   y_c < y_b + (y_a-y_b)*(t_b-t_c)/(t_b-t_a);
%   time_series - input series
%   current_index - index of analyzed element of time series
%   index_of_element_to_check - index of element we check visibility
%   against
%   [1] - L Lacasa et al. - From time series to complex networks: The
%   visibility graph, https://doi.org/10.1073/pnas.0709247105

    

    value = true;
    for i=current_index+1:1:index_of_element_to_check
        val = time_series(i);
        
        val_to_check = time_series(index_of_element_to_check);
        val_current = time_series(current_index);
        
        if val > val_to_check + (val_current-val_to_check)*(index_of_element_to_check-i)/(index_of_element_to_check-current_index)
            value = false;
            return;
        end
    end
end

