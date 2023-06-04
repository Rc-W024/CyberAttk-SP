% Simulation of Computer Virus Propagation Mathematical Model
clear all;
close all;

% Parameters setting
N=100; % number of computers
M=15; % number of data communications between computers
X0=1; % initial number of infected computers

% Time generation
num_time_units=100; % number of time unit for the simulation
time=1:num_time_units; % timeline

% Mathematical expectation of propagation
Xn=N./(1+(N-1)*exp(-time*M/N));

% make plot...
plot(time,Xn)
grid on
xlabel('Time')
ylabel('Number of virus-infected computers')
%set(gca,'Box','off')
