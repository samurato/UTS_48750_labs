classdef Trunk
    %Trunk class
    %   Used to generate trunk links
    
    properties
        avg_call_duration;
        is_in_call;
        time_in_call;
    end
    
    methods
        % Entity constructor
        % returns Entity object
        function obj = Trunk(avg_call_duration)
            if isnumeric(avg_call_duration)
                obj.avg_call_duration = avg_call_duration;
                obj.is_in_call = false;
            else
                error('Must provide an average call duration!');
            end
        end
        
        % Start call function
        function obj = startCall(obj)
            obj.is_in_call = true;
            obj.time_in_call = 0.0;
        end
        
        % End call function
        function obj = endCall(obj)
            obj.is_in_call = false;
        end
      
        % Time tick function
        function obj = tick(obj, time)
            obj.time_in_call = obj.time_in_call + time;
        end
    end
    
end

