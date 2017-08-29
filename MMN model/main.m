% M/M/N simulation
% Patrick Miziewicz & Zach Newton

%constants
max_time = 30.0;
call_duration = 12;
trunk_count = 30;
observed_call_count = 50;
number_of_ticks = 0;

%variables
average_lines_in_use = 0.0;
grade_of_service = 0.0;
simulation_time = 0.0;

% Initialise Trunk array
all_comm_lines(1, trunk_count) = ObjectConstructor(); %TODO
for n = 1:trunk_count
  all_com_lines(n) = Trunk(call_duration);
end

for i = 1:number_of_ticks
    
end

