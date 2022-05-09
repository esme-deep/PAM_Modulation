%%make the channel function


%Tb = 0.1 ;
%alpha_n = 0.7;
%tau_n = Tb/100;
%M = 10;
%TIME=0:Tb:((M-1)*Tb);





%t = linspace(0,2*pi) ;
%x = sin(pi/4*t) ;
%plot(t,x,'r')
%hold on
%x = sin(pi/4*t+pi/2) ; 
%sssplot(t,x,'b')



%%quatifier la puissance du signal 

%% recepteur recoit un seul bruit : donc faut faire la somme des signaus atténués puis ajouter un bruit a tout

function y = channel(Sn,Tb,M,alpha)
  time = 0:Tb:((M-1)*Tb);
  tau_n = Tb/10;
  time_shifted = tau_n:Tb:((M-1)*Tb) + tau_n;
  plot(time,Sn,'*');
  hold on
  plot(time_shifted,alpha*Sn,'*');
  hold off
end

