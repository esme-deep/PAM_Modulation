Tb = 0.1; %period of a bit

M =6 ;%length of the message
N = 4; %number of messages
Beta = 100;
Tn = Tb/Beta %period of sampling
Alpha = 0.4
L     = 10;
R     =1000; %débit binaire
gamma =10;
Ta = Tn/gamma; % durée d'échantillon analogique
Freq_a = 1/Ta;
Bp=(1+Alpha)/(2*Tb);
maxOFTau_n = 200;
Lr=gamma*Beta*(M+2*L)+ maxOFTau_n;

Ordre = 3;

Matrice_Filtre = zeros(Lr,N);
requence_Filtre = Freq_a/2*(0:1:(Lr-1))/Lr;
    for i = 1:N
        if( i == 1)
            
            [b,a] = cheby1(Ordre,0.5,Bp,'low','s');
            
        else if ( i > 1)
                
            Freq_Coupure = [ (((4*pi*(i-1))/Tb) - Bp) (((4*pi*(i-1))/Tb) + Bp)   ];
                [b,a] = cheby1(Ordre,0.5,Freq_Coupure,'bandpass','s');
                
            end;
        end;
        
        Matrice_Filtre(:,i)= freqs(b,a,2*pi*Frequence_Filtre);
    end;

for i = 1:N
    figure(13)
    plot(abs(Matrice_Filtre));
    title('Filtrage Fréquentiel Analogique');
    xlabel('fréquence(Hz)');
    ylabel('Amplitude');
    grid on;
end