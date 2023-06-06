% Simulation for CyberAttk. Computer virus simulation signal modulation
close all;
clear;

%%% adjuste according to the actual situation %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs=1e9; % sampling frequecy
fc=120e9; % center freq: 120 GHz - THz radar transmitter
bitRate=1e6; % data rate
numBits=500; % % number of binary digits
zeropad=16; % zero-padding
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Step 1: Generate a random stream of computer code data to simulate a virus
% code data generation
data_binary=randi([0 1],numBits,1);  % generate random binary data

%disp(code_data);

% calculate the duration and number of samples per bit
bitDuration=1/bitRate;
numSamplesBit=round(bitDuration*fs);

%% Step 2: Generate a carrier signal
t=(0:numBits*numSamplesBit-1)/fs;
carrierSig=zeros(1,length(t));

% figure;
% plot(carrierSig)

for i=1:numBits
    bit=data_binary(i);
    carrierSig((i-1)*numSamplesBit+1:i*numSamplesBit)=bit;
end

% FFT
FFTc=fft(carrierSig,length(carrierSig)*zeropad);
figure;
plot(abs(FFTc));
title('FFT of carrier signal')

%% Step 3: FSK modulation
deltaF=bitRate/2; % frequecy shift
modulatedSig=cos(2*pi*(fc+deltaF*carrierSig).*t);

% FFT
FFTm=fft(modulatedSig,length(carrierSig)*zeropad);
figure;
plot(abs(FFTm));
title('FFT of modulated signal')

%% Print figures...
figure;
subplot(2,2,1);
plot(data_binary);
title('Computer code data stream');
subplot(2,2,2);
plot(t,carrierSig);
xlabel('Time');
ylabel('Amplitude');
title('Carrier signal');
subplot(2,2,3:4);
plot(t,modulatedSig);
xlabel('Time');
ylabel('Amplitude');
title('Modulated signal');

%disp('Mission completed!');


