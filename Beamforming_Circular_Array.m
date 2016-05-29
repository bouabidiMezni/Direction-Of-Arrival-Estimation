%-------------------------------------------------------------------------------------------------------------------------------------------
                                                  % Beamforming: Uniform Linear Array     
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

%radius of the circular array
a=(d)/(2*sin(pi/N));

%source signal
for k=1:M 
    D(k,:) = randint(1,Nb);
    S(k,:) =A*(2*D(k,:) - 1);
end   



for i=1:M
    for k=1:N;
        phi(k)=(2*pi*(k-1))/N;
        SteeringVector(k,i)=exp(j*(beta*a*cos(theta(i)*pi/180)*cos(phi(k))-sin(theta(i)*pi/180)*cos(phi(k))));
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
 
    A1=zeros([N 1]);
    for k=1:N
       phiii(k)=(2*pi*(k-1))/N;
        A1(k,1)= exp(j*(beta*a*cos(theta1(i)*pi/180)*cos(phiii(k))-sin(theta1(i)*pi/180)*cos(phi(k))));
    end;
   PBeamforming (i)= real(diag(A1'*Rxx*A1))/(N^2);
end;


figure(1);
plot(theta1,10*log10(PBeamforming ));
title('Beamforming spectrum');
xlabel('Angle [degree]');
ylabel('PBeamforming [dB]');
grid on;







