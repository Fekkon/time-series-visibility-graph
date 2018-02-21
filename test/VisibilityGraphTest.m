classdef VisibilityGraphTest < matlab.unittest.TestCase
    
    properties
        time_series = [1 2 3 4 3 5 7 7];
    end
    
    methods(Test)
        
        function angle_sign_test(testCase)
            result = calculate_visibility_graph(testCase.time_series,1);
            testCase.verifyLessThan(result.angle_vector(1).values(1).val,0);
            testCase.verifyGreaterThan(result.angle_vector(2).values(1).val,0);
        end
        
        function angle_test_between_first_and_zero_element_not_exist(testCase)
            result = calculate_visibility_graph(testCase.time_series,1);
            testCase.verifyNotEqual(result.angle_vector(1).values(1).index,0);
        end
        
        function angle_test_between_first_and_second_element(testCase)
            result = calculate_visibility_graph(testCase.time_series,1);
            testCase.verifyEqual(result.angle_vector(1).values(1).val,-1.5574,'AbsTol',0.001);
        end
       
        function angle_test_between_next_to_last_and_last_not_exist(testCase)
            result = calculate_visibility_graph(testCase.time_series,1);
            testCase.verifyNotEqual(result.angle_vector(8).values(end),9);
        end
            
        function angle_test_max_range_greater_than_1(testCase)
            result = calculate_visibility_graph(testCase.time_series,2);
            testCase.verifyEqual(result.angle_vector(2).values(1).val,1.5574,'AbsTol',0.001)
            testCase.verifyEqual(result.angle_vector(2).values(1).index,1)
            testCase.verifyEqual(result.angle_vector(2).values(2).val,-1.5574,'AbsTol',0.001)
            testCase.verifyEqual(result.angle_vector(2).values(2).index,3)
            testCase.verifyEqual(result.angle_vector(2).values(3).val,-1.5574,'AbsTol',0.001)
            testCase.verifyEqual(result.angle_vector(2).values(3).index,4)
            testCase.verifyEqual(length(result.angle_vector(2).values),3)
        end
        
        function angle_test_max_range_not_specified(testCase)
            result = calculate_visibility_graph(testCase.time_series);
            testCase.verifyEqual(length(result.angle_vector(5).values),6);
        end
        
        function max_range_not_specified_test(testCase)
            result = calculate_visibility_graph(testCase.time_series);
            testCase.verifyEqual(result.max_range,8)
        end
        
        function max_range_specified_test(testCase)
            result = calculate_visibility_graph(testCase.time_series,2);
            testCase.verifyEqual(result.max_range,2)
        end
    end
    
end

