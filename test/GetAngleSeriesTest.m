classdef GetAngleSeriesTest < matlab.unittest.TestCase
    
    properties
    end
    
    
    methods(Test)
       
        
        function throws_exception_when_range_bigger_than_maximum_range(testCase)
            visibility_graph.max_range=8;
            testCase.verifyError(@()get_angle_series(visibility_graph,10),'get_angle_series:range_error')
        end
        
        
        function extract_angle_series_for_range_1_and_one_directon(testCase)
            visibility_graph.angle_vector(1).values(1) = struct('val',-1.5574,'index',2);
            
            visibility_graph.angle_vector(2).values(1) = struct('val',1.5574,'index',1);
            visibility_graph.angle_vector(2).values(2) = struct('val',-1.5574,'index',3);
            
            visibility_graph.angle_vector(3).values(1) = struct('val',1.5574,'index',2);
            visibility_graph.angle_vector(3).values(2) = struct('val',-1.5574,'index',4);
            
            visibility_graph.angle_vector(4).values(1) = struct('val',1.5574,'index',3);
            visibility_graph.angle_vector(4).values(2) = struct('val',1.5574,'index',5);
            
            visibility_graph.angle_vector(5).values(1) = struct('val',-1.5574,'index',4);
            visibility_graph.angle_vector(5).values(2) = struct('val',2.1850, 'index',6);
            
            visibility_graph.angle_vector(6).values(1) = struct('val',-2.1850,'index',5);
            visibility_graph.angle_vector(6).values(2) = struct('val',2.1850,'index',7);
            
            visibility_graph.angle_vector(7).values(1) = struct('val',-2.1850,'index',6);
            visibility_graph.angle_vector(7).values(2) = struct('val',0.0,'index',8);
            
            visibility_graph.angle_vector(8).values(1) = struct('val',0.0,'index',7);
            
            visibility_graph.max_range=2;
            
            
            angle_series = get_angle_series(visibility_graph,1);
            testCase.verifyEqual(length(angle_series),7);
            testCase.verifyEqual(angle_series(1),-1.5574);
            testCase.verifyEqual(angle_series(2),-1.5574);
            testCase.verifyEqual(angle_series(7),0.0);
        end
        
        function extract_angle_series_for_range_higher_than_1_and_one_directon(testCase)
            visibility_graph.angle_vector(1).values(1) = struct('val',-1.5574,'index',2);
            
            visibility_graph.angle_vector(2).values(1) = struct('val',1.5574,'index',1);
            visibility_graph.angle_vector(2).values(2) = struct('val',-1.5574,'index',3);
            visibility_graph.angle_vector(2).values(2) = struct('val',-1.5574,'index',4);
            
            visibility_graph.angle_vector(3).values(1) = struct('val',1.5574,'index',2);
            visibility_graph.angle_vector(3).values(2) = struct('val',-1.5574,'index',4);
            visibility_graph.angle_vector(3).values(2) = struct('val',2.1850,'index',5);
            
            visibility_graph.angle_vector(4).values(1) = struct('val',1.5574,'index',2);
            visibility_graph.angle_vector(4).values(1) = struct('val',1.5574,'index',3);
            visibility_graph.angle_vector(4).values(2) = struct('val',1.5574,'index',5);
           
            
            visibility_graph.max_range=2;
            
            angle_series = get_angle_series(visibility_graph,2);
            testCase.verifyEqual(length(angle_series),2);
            testCase.verifyEqual(angle_series(1),NaN(1));
            testCase.verifyEqual(angle_series(2),-1.5574);

        end
        
    end
    
end

