% ----------------------------------------------------------------------
%                    Root-MUSIC algorithm 
%         
%  Code edited by: Imen BOUABIDI & Ameni MEZNI,
%  Telecommunication engineering students 
%  in National Engineering School of Tunis - Tunisia                          
% ----------------------------------------------------------------------

close all;
clear all;
clc;
%%   Paramètres
% Carrier frequency (Hz)
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
theta = [40 80]; 

% Number of signals
M = length(theta);

% Number of antennas 
N = 10;  

% Wavenumber
beta=2*pi/wavelength;

% Signal amplitude
A = [1]; 

% SNR (dB)
snr = 5;  

% Variance of noise
sigma=sqrt((A^2)/(2*10^(snr/10)));

% Source signal
for k=1:M 
    D(k,:) = randint(1,Nb);
    S(k,:) =A*(2*D(k,:) - 1);
end;   
  
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
Ps = V(:,1:M)*V(:,1:M)';
Pn = eye(N)-Ps;

% Determinating roots
b=zeros(2*N-1,1);
for k=-N+1:N-1
    b(k+N,1)=sum(diag(Pn,k)); 
end
zm=roots(b);
[bide,I]=sort(abs(abs(zm)-1));
zmi=zm(I(2:2:2*M));

% Direction Of Arrival Estimation
doa = acosd(-angle(zmi)/(2*pi*d))



