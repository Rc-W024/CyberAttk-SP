% Simulation for CyberAttk. Computer virus simulation signal modulation
close all;
clear;

%%% adjuste according to the actual situation %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs=1000; % sampling frequecy
fc=120e9; % center freq: 120 GHz - THz radar transmitter
bitRate=1e6; % data rate: 1 Mbps
numBits=200; % number of binary digits
zeropad=16; % zero-padding
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Step 1: Generate a random stream of computer code data to simulate a virus
% code data generation
data_binary=randi([0 1],1,numBits);  % generate random binary data
bitDuration=1/bitRate; % duration of each bit of data

%disp(code_data);

%% Step 2: Generate a carrier signal
% time vector
t=linspace(0,bitDuration*length(data_binary),length(data_binary)*fs);

% carrier signal
carrierSig=cos(2*pi*fc*t);

% FFT
FFTc=fft(carrierSig,length(carrierSig)*zeropad);
figure;
plot(abs(FFTc));
title('FFT of carrier signal')

%% Step 3: FSK modulation
modulatedSig=[];
for i = 1:length(data_binary)
    if data_binary(i) == 0
        modulatedSig=[modulatedSig cos(2*pi*(fc-bitRate/2)*t((i-1)*fs+1:i*fs))];
    else
        modulatedSig=[modulatedSig cos(2*pi*(fc+bitRate/2)*t((i-1)*fs+1:i*fs))];
    end
end

% FFT
FFTm=fft(modulatedSig,length(carrierSig)*zeropad);
figure;
plot(abs(FFTm));
title('FFT of modulated signal')

%% Print figures...
figure;
plot(t,carrierSig);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');

figure;
plot(t,modulatedSig);
xlabel('Time');
ylabel('Amplitude');
title('Modulated Signal');

figure;
spectrogram(modulatedSig,hann(256),250,1024,fs,'yaxis');
title('Spectrum');

