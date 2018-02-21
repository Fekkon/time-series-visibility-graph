classdef IsVisibleTest < matlab.unittest.TestCase
    
    properties
        time_series = [1 2 3 4 3 5 7 7];
    end
    
    methods(Test)
        
        function is_visible_next_greater_value(testCase)
            testCase.verifyEqual(is_visible(testCase.time_series,1,2),true);
        end
        
        function is_visible_next_lower_value(testCase)
            testCase.verifyEqual(is_visible(testCase.time_series,4,5),true);
        end
        
        function is_visible_same_value_next_to_each_other(testCase)
            testCase.verifyEqual(is_visible(testCase.time_series,7,8),true);
        end
        
        function is_visible_lower_value_between(testCase)
            testCase.verifyEqual(is_visible(testCase.time_series,4,6),true);
        end
        
        function is_visible_greater_value_between(testCase)
            testCase.verifyEqual(is_visible(testCase.time_series,3,5),false);
        end
        
        % this test case reflects a situtation when proportion between
        % current_element (index=5) and next element (index=6) is the same  
        % as next element (index=6) and target element (index=7)
        function is_visible_greater_value_between_but_same_proportion(testCase)
            testCase.verifyEqual(is_visible(testCase.time_series,5,7),true);
        end
        
        % this test case reflects a situation when proportion between
        % current_element (index=3) and next element (index=4) is lower
        % than current_element(index=3) and target element (index=6)
        function is_visible_greater_value_between_lower_higher_proportion(testCase)
            testCase.verifyEqual(is_visible(testCase.time_series,3,6),false);
        end
        
    end
    
end

