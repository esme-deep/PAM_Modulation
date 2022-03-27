%generate random sequences ak  ak = round(rand(10,3))*2 - 1%


nb_elements= 10; %M
nb_sequences= 3 ; %n

function y = a_generator(nb_elements,nb_sequences)
  y= round(rand(nb_elements,nb_sequences))*2 - 1
end


Tb = 1; %period of a bit
M =6 ;%length of the message
N = 4; %number of messages
Beta = 4;
Tn = Tb/Beta %period of sampling

ak = a_generator(M,N);
TIME=0:Tb:((M-1)*Tb) %time axis from 0 to (m-1)*tb with tb step

figure(1) %draw the N random sequences
for i=1:N 
  subplot(N,1,i)
  stem(TIME,ak(:,i),'*')
  title('bits sequence');  
  xlabel('Time[s]');
  ylabel('Amplitude');
  grid on;              
end


function y = upsample(ak,Beta)
  row = size(ak)(1);
  col = size(ak)(2) ;
  y = zeros(Beta*row,col);
  y(1,:)=ak(1,:);
  for i=2:row
   y(i+(Beta-1)*(i-1),:)=ak(i,:);
  end
 end

upsampledsignal= upsample(ak,Beta)

figure(2) %draw the N random sequences with zeros in between for the upsampling
for i=1:N 
  subplot(N,1,i);
  t=0:Tn:((M*Beta-1)*Tn);
  stem(t,upsampledsignal(:,i),'*');
  title('up sampled bits sequence');
  xlabel('Time[s]');
  ylabel('Amplitude');
  grid on;              
end
pause;

filterr = rcosfir(0.4,10,Beta,Tb);

L     = 10;
filter_range= ((-L*Tb):Tn:(L*Tb));

plot(filter_range,filterr);
 
function y = p_generator()
  
end
