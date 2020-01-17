Bread and butter 2 arm bandit task coded in MATLAB. 

2 arm bandit with one bandit having a low probability of reward (0.2) and the other having a high probability (0.8)

You can alter the probabilities at the top of the code. 

Learns with two learning rates - 0.2 for bad, 0.5 for good. You can change these as well at the top. 

In this setup, this will generally mean that the learning rate is "bad" whenever the outcome is 0 and "good" whenever it is 1. 

You only get feedback for the option you choose. 

Choice depends on the difference in estimates for the two bandits controlled by a softmax. I've set the value for this to 2 but you can change this at the top as well. Higher values mean the person will be more sensitive to the difference. 

It runs for 180 trials but again this can be changed to run over more/less trials. 

Not the most elegant piece of code and may have bugs. 
