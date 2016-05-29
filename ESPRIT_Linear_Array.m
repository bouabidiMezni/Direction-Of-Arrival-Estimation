%----------------------------------------------------------------------
%                      ESPRIT algorithm 
%
%   Code edited by: Imen BOUABIDI & Ameni MEZNI,
%   Telecommunication engineering students 
%   in National Engineering School of Tunis - Tunisia 
% ----------------------------------------------------------------------
close all;
clear all;
clc;
%%  
% Carrier frequency
fc = 3e8;

% Number of snapshots
Nb = 1000;

% Speed ol light(m/s)
c = 3e8;

% The wavelength of the received signal 
wavelength = c/fc;

% Element spacing      
d = 0.5*wavelength; 

% Direction of Arrival
theta = [5 40];

% Number of signals
M = length(theta);

% Number of antennas
N = 10;

% Wavenumber
beta = 2*pi/wavelength;

% Signal amplitude
A = 1;   

% SNR (dB)
snr = 5;    

% Variance of noise
sigma=sqrt((A^2)/(2*10^(snr/10)));

% Source signal 
D = randint(M,Nb);
S =A*(2*D - 1);

% The electrical phase shift from element to element along the array
phi=beta*d*cos(theta*pi/180);  

% Matrix of steering vectors
for i=1:M
  for k=1:N;
    VecteurDirectionnel(k,i)= exp(j*(k-1)*phi(i));
  end
end

% White Gaussien noise
B = (sigma^2)*(randn(N,Nb)+j*randn(N,Nb))/sqrt(2);

% Array output:signal plus noise
X = VecteurDirectionnel*S+B;

% Estimation of the spatial correlation matrix of the observed signal
Rxx = X*X'/Nb;

% Eigen decomposition
[Vi,Li] = eig(Rxx);
[L,I] = sort(diag(Li),'descend');
V = Vi(:,I);
Vs = V(:,1:M);
Vs1=Vs(1:N-1,:);
Vs2=Vs(2:N,:);

% Direction Of Arrival
% Least square

xsi=linsolve(Vs(1:N-1,:),Vs(2:N,:));
% DOA estimation
doa=acosd((angle(eig(xsi))/(2*pi*d)))










