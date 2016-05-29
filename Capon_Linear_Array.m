%-------------------------------------------------------------------------------------------------------------------------------------------
                                                  % Capon: Uniform Linear Array     
                                              %Code edited by Imen BOUABIDI & Ameni MEZNI,
                          % Telecommunication engineering students in National Engineering School of Tunis - Tunisia
%-------------------------------------------------------------------------------------------------------------------------------------------
close all;
clear all;
clc;
%%   Parameters

% Carrier frequency (Hz)
fc = 3e8; 

% Number of snapshots
Nb = 1000; 

%Speed ol light(m/s)
c=3e8;

%the wavelength of the received signal
wavelength = 3e8/fc;     

% element spacing
d = 0.5*wavelength;  

% Number of antennas 
N = 10; 

%Wavenumber
beta=2*pi/wavelength;               

%Signal amplitude
A = 1;

%SNR(dB)
snr = 5;

% Direction of Arrival
theta = [30 80];

%Variance of noise
sigma = sqrt((A^2)/(2*10^(snr/10)));

%Number of signals
M = length(theta);

%source signal
for k=1:M 
    D(k,:) = randint(1,Nb);
    S(k,:) =A*(2*D(k,:) - 1);
end   



%the electrical phase shift from element to element along the array
phi=beta*d*cos(theta*pi/180);

%matrix of steering vectors
for i=1:M
for k=1:N
    SteeringVector(k,i)= exp((k-1)*1i*phi(i));
end
end
% White Gaussien noise
B = (sigma^2)*(randn(N,Nb)+j*randn(N,Nb))/sqrt(2);

%Array output:signal plus noise
X = SteeringVector*S+B;

% Estimation of the spatial correlation matrix of the observed signal
Rxx = X*X'/Nb;

theta1=[0:180];
for i=1:length(theta1)
    phi1 = 2*pi*d*cos(theta1(i)*pi/180);
    A1=zeros([N 1]);
    for k=1:N
        A1(k,1)= exp((k-1)*1i*phi1);
    end;
    PCapon(i)= 1./(real(diag(A1'*inv(Rxx)*A1)));
end;


figure(1);
plot(theta1,10*log10(PCapon));
title('Capon spectrum');
xlabel('Angle [degee]');
ylabel('PCapon [dB]');
grid on;







