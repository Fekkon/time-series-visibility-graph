function [ angle_series ] = get_angle_series(visibility_graph_data, range)

if range > visibility_graph_data.max_range
   throw(MException('get_angle_series:range_error',['Cannot retrive angle series for speficied range: ',range,...
       '. Visiblity graph was calculated for maximum range: ',visibility_graph_data.max_range])) 
end


angle_series = zeros(length(visibility_graph_data.angle_vector)-range,1);

for i=1:1:length(visibility_graph_data.angle_vector)-range
    
    angle_value_index = find([visibility_graph_data.angle_vector(i).values.index] == i+range);
    
    if ~isempty(angle_value_index)
        angle_series(i) = visibility_graph_data.angle_vector(i).values(angle_value_index).val;
    else 
        angle_series(i) = NaN(1);
    end
end

end

