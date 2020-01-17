%code to simulate a 2 arm bandit with sep learning rates for pos and
%negative feedback
%NGarrett, Jan 2020

%clear everything
clear all; close all; clc;

%learning rates
alpha_good = 0.5;
alpha_bad = 0.2;

%slope of softmax
beta = 2;

%number of trials
n_trials = 180;

%prob payout of each bandit
prob = [0.2 0.8];

%initalise estimated value of each bandit (left, right) to 0.5
Q = zeros(1, 2) + 0.5;

%initalise these - store trial by trial variables
Q_inital = NaN*ones(n_trials, 2);
Q_new = NaN*ones(n_trials, 2);
outcome = NaN*ones(n_trials, 1);
dv = NaN*ones(n_trials, 1);
prob_choose_left = NaN*ones(n_trials, 1);
choose_left = NaN*ones(n_trials, 1);

for t = 1:n_trials

    %store Q value at the start of the trial 
    Q_inital(t, 1:2) = Q;
    
    %difference in Q values (left min right) - used to predict choice
    dv(t, 1) = Q_inital(t, 1) - Q_inital(t, 2);
    
    prob_choose_left(t, 1) = 1 - (1/(1+exp(beta*dv(t, 1))));
    choose_left(t, 1) = rand<=prob_choose_left(t, 1);
        
    %outcome and update
    if choose_left(t, 1)
        
        outcome(t, 1) = rand<=prob(1, 1);
        
        %determine learning rate
        if Q(1)<outcome(t, 1)
            lr = alpha_good;
        else
            lr = alpha_bad;
        end
        
        %update
        Q(1) = (1-lr)*Q(1) + lr*outcome(t, 1);
        
    else
        
        outcome(t, 1) = rand<=prob(1, 2);

        %determine learning rate
        if Q(2)<outcome(t, 1)
            lr = alpha_good;
        else
            lr = alpha_bad;
        end
        
        %update
        Q(2) = (1-lr)*Q(2) + lr*outcome(t, 1);
        
    end
    
    %store new (updated) Q value
    Q_new(t, 1:2) = Q;
    
end

%plot value over time
X=1:n_trials;
plot(X, Q_new);



