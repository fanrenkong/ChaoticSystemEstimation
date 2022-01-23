%% Chaotic system
% @author Kevin Kong
% @email kevin@fanrenkong.com
function f = chaotic_system(x,func_num)
    if func_num == 1 
        fhd = str2func('Lorenz');
    elseif func_num == 2
        fhd = str2func('Chen');
    elseif func_num == 3
        fhd = str2func('NewtonLeipnik');
    elseif func_num == 4
        fhd = str2func('Rossler');
    elseif func_num == 5
        fhd = str2func('Volta');
    end
    f = feval(fhd, x);
end

function fitness = Lorenz(x)
    assert(length(x) == 3)
    T = 300; % 采样数
    % 原始系统参数设置
    a = 10;
    b = 28;
    c = 8/3;
    % 采样T个状态量
    fitness = 0;
    % 原始系统参数
    xt = LorenzSample(1,0,0,a,b,c,T);
    xe = LorenzSample(1,0,0,x(1),x(2),x(3),T);
    for t = 1:T
        MSE = (xt(t,1) - xe(t,1))^2 + (xt(t,2) - xe(t,2))^2 + (xt(t,3) - xe(t,3))^2;
        fitness = fitness + MSE;
    end
    % 计算目标函数值(误差)
    fitness = fitness / T;
end

function fitness = Chen(x)
    assert(length(x) == 4)
    T = 300; % 采样数
    % 原始系统参数设置
    a = 35;
    b = 27;
    c = 3;
    d = -7;
    % 采样T个状态量
    fitness = 0;
    % 原始系统参数
    xt = ChenSample(1,1,1,a,b,c,d,T);
    xe = ChenSample(1,1,1,x(1),x(2),x(3),x(4),T);
    for t = 1:T
        MSE = (xt(t,1) - xe(t,1))^2 + (xt(t,2) - xe(t,2))^2 + (xt(t,3) - xe(t,3))^2;
        fitness = fitness + MSE;
    end
    % 计算目标函数值(误差)
    fitness = fitness / T;
end

function fitness = NewtonLeipnik(x)
    assert(length(x) == 2)
    T = 300; % 采样数
    % 原始系统参数设置
    a = 0.4;
    b = 0.175;
    % 采样T个状态量
    fitness = 0;
    % 原始系统参数
    xt = NewtonLeipnikSample(0.1,0,0.1,a,b,T);
    xe = NewtonLeipnikSample(0.1,0,0.1,x(1),x(2),T);
    for t = 1:T
        MSE = (xt(t,1) - xe(t,1))^2 + (xt(t,2) - xe(t,2))^2 + (xt(t,3) - xe(t,3))^2;
        fitness = fitness + MSE;
    end
    % 计算目标函数值(误差)
    fitness = fitness / T;
end

function fitness = Rossler(x)
    assert(length(x) == 3)
    T = 300; % 采样数
    % 原始系统参数设置
    a = 0.32;
    b = 0.3;
    c = 4.5;
    % 采样T个状态量
    fitness = 0;
    % 原始系统参数
    xt = RosslerSample(0.1,0.1,0.1,a,b,c,T);
    xe = RosslerSample(0.1,0.1,0.1,x(1),x(2),x(3),T);
    for t = 1:T
        MSE = (xt(t,1) - xe(t,1))^2 + (xt(t,2) - xe(t,2))^2 + (xt(t,3) - xe(t,3))^2;
        fitness = fitness + MSE;
    end
    % 计算目标函数值(误差)
    fitness = fitness / T;
end

function fitness = Volta(x)
    assert(length(x) == 3)
    T = 300; % 采样数
    % 原始系统参数设置
    a = 5;
    b = 85;
    c = 0.5;
    % 采样T个状态量
    fitness = 0;
    % 原始系统参数
    xt = VoltaSample(0.8,20,0.01,a,b,c,T);
    xe = VoltaSample(0.8,20,0.01,x(1),x(2),x(3),T);
    for t = 1:T
        MSE = (xt(t,1) - xe(t,1))^2 + (xt(t,2) - xe(t,2))^2 + (xt(t,3) - xe(t,3))^2;
        fitness = fitness + MSE;
    end
    % 计算目标函数值(误差)
    fitness = fitness / T;
end

%% Lorenz采样
function samples = LorenzSample(x0,y0,z0,a,b,c,T)
    h = 0.0005;
    for t = 1:T
        xt = x0 + h*a*(y0-x0);
        yt = y0 + h*(b*x0-y0-x0*z0);
        zt = z0 + h*(x0*y0-c*z0);
        x0 = xt;
        y0 = yt;
        z0 = zt;
        samples(t,:) = [x0,y0,z0];
    end
end
%% Chen采样
function samples = ChenSample(x0,y0,z0,a,b,c,d,T)
    h = 0.0001;
    for t = 1:T
        xt = x0 + h*a*(y0-x0);
        yt = y0 + h*(d*x0-x0*z0+c*y0);
        zt = z0 + h*(x0*y0-b*z0);
        x0 = xt;
        y0 = yt;
        z0 = zt;
        samples(t,:) = [x0,y0,z0];
    end
end
%% NewtonLeipnik采样
function samples = NewtonLeipnikSample(x0,y0,z0,a,b,T)
    h = 0.01;
    for t = 1:T
        xt = x0 + h*(-a*x0+y0+10*y0*z0);
        yt = y0 + h*(-x0-0.4*y0+5*x0*z0);
        zt = z0 + h*(b*z0-5*x0*y0);
        x0 = xt;
        y0 = yt;
        z0 = zt;
        samples(t,:) = [x0,y0,z0];
    end
end
%% Rossler采样
function samples = RosslerSample(x0,y0,z0,a,b,c,T)
    h = 0.01;
    for t = 1:T
        xt = x0 + h*(-y0-z0);
        yt = y0 + h*(x0+a*y0);
        zt = z0 + h*(b*x0-c*z0+x0*z0);
        x0 = xt;
        y0 = yt;
        z0 = zt;
        samples(t,:) = [x0,y0,z0];
    end
end
%% Volta采样
function samples = VoltaSample(x0,y0,z0,a,b,c,T)
    h = 1e-5;
    for t = 1:T
        xt = x0 + h*(-x0-a*y0-y0*z0);
        yt = y0 + h*(-y0-b*x0-x0*z0);
        zt = z0 + h*(c*z0+x0*y0+1);
        x0 = xt;
        y0 = yt;
        z0 = zt;
        samples(t,:) = [x0,y0,z0];
    end
end