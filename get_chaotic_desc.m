%% Chaotic system
% @author Kevin Kong
% @email kevin@fanrenkong.com
function [lb,ub,D] = get_chaotic_desc(func_num)
    if func_num == 1 
        lb = [1,0,0];
        ub = [50,50,20];
        D = 3;
    elseif func_num == 2
        lb = [1,1,1,-20];
        ub = [50,50,20,20];
        D = 4;
    elseif func_num == 3
        lb = [0,0];
        ub = [5,5];
        D = 2;
    elseif func_num == 4
        lb = [0,0,0];
        ub = [10,10,20];
        D = 3;
    elseif func_num == 5
        lb = [0,10,0];
        ub = [50,100,20];
        D = 3;
    end
end

