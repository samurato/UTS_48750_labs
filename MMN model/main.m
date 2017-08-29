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

% Initialise Line array
all_comm_lines(1, trunk_count) = ObjectConstructor(); %TODO

for i = 1:number_of_ticks
    
end


%Poission Function
function y = poisson(x,u,T)
u=u*T
    if u < 0 
        y=0
        elseif x < 0
        y=0
    else
        p=((u^x)*exp(-u))/factorial(x);
        y = p;
    end
end



function [C]=ErlangC(A,N)
    % Erlang B calculation
    EB = (A^N/factorial(N))/sum(A^(0:N)/factorial(0:N));
    % Calc C
    EC = (N/(N-A))*B;
    %Outut verification
    if C>1
        C=1
    else
        if C<0
            C=0
        end
    end
end



