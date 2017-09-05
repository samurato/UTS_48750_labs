% M/M/N simulation
% Patrick Miziewicz & Zach Newton

%constants
max_time = 30.0;
avg_call_duration = 12;
trunk_count = 30;
observed_call_count = 50;
number_of_ticks = max_time * 60;
observation_time = 1/60;

%variables
average_lines_in_use = 0.0;
grade_of_service = 0.0;
simulation_time = 60;
qeueue_length = 0;
all_trunks(1:trunk_count) = Trunk(avg_call_duration);
call_probability = input('Enter the call probability (0.00 - 1.00): ');
results(1:simulation_time) = 0;
dropped_calls(1:simulation_time) = 0;

for i = 1:number_of_ticks
    
    qeueue_length = 0;% calculate amount of people to put in calls this tick
                      % do not override this variable. Values carry over
                      % from tick to tick
    people_in_calls = 0;
    for ii = 1:trunk_count
        %all_trunks(ii).tick();
        if all_trunks(ii).is_in_call == true
            people_in_calls = people_in_calls + 1;
            % Gen rand num and check against probability of hanging up
            
            % hang up if true
            if isCallEnding(number_of_calls, observation_time, avg_call_duration) == true
                all_trunks(ii).endCall();
            end
        elseif qeueue_length > 0
            % Gen rand num and check against probability of picking up
            if randomGen(call_probability) == true  
               all_trunks(ii).startCall(); 
            end
            qeueue_length = qeueue_length - 1;
        end
    end
    results(i) = people_in_calls;
    dropped_calls(i) = qeueue_length;
end

time(1:simulation_time) = 0;
for i = 1:simulation_time
   time(i) = i; 
end

plot(time, results, time, dropped_calls),
legend('Trunks Occupied', 'Calls Dropped')
xlabel('Time'), ylabel('Count')
title('Trunks occupied and dropped calls over time');

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

% get blocked_calls array and results array.
function gos = calcGradeOfService(blocked_calls, offered_calls)
    blocked_calls = sum(blocked_calls);
    offered_calls = sum(offered_calls);
    gos = blocked_calls / (offered_calls + blocked_calls);
end

function isCallWaiting = randomGen(probability)
   r = rand(1);
   if probability <= r
       isCallWaiting = true
   else
       isCallWaiting = false
   end
end

function endCall = isCallEnding(number_of_calls, observation_time, avg_call_duration)
    probability = (number_of_calls * observation_time)/ avg_call_duration
    endCall = randomGen(probability);
end



