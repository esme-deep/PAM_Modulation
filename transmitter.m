%generate random sequences ak  ak = round(rand(10,3))*2 - 1%
clear all

nb_elements= 10; %M
nb_sequences= 3 ; %n

function y = a_generator(nb_elements,nb_sequences)
  y= round(rand(nb_elements,nb_sequences))*2 - 1
end


Tb = 0.1; %period of a bit

M =6 ;%length of the message
N = 4; %number of messages
Beta = 50;
Tn = Tb/Beta %period of sampling

ak = a_generator(M,N);
TIME=0:Tb:((M-1)*Tb) %time axis from 0 to (m-1)*tb with tb step
 %draw the N random sequences
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
  col = size(ak)(2);
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
%pause;

filterr= rcosfir(0.4,10,Beta,Tb);
L=10;
filter_range = ((-L*Tb):Tn:(L*Tb));

for i=1:N 
  %subplot(N,1,i);
  figure(2+i)
  carrier(i,:) = cos((4*pi*(i-1)/Tb).*filter_range);
  pn = filterr.*carrier(i,:);
  plot(filter_range,pn);  
end

carrier(2,:) = cos((4*pi*1000/Tb)*filter_range);
%carrier(3,:) = cos((4*pi/Tb)*filter_range);
%figure(4)
%plot(filter_range,filterr.*carrier(3,:),filter_range,filterr);

p2 = filterr.*carrier(2,:);
temp(2,:) = upsampledsignal(:,2);
output(2,:)= conv(p2,temp(2,:));
size = columns(output(2,:)) -1;
t =(0:Tn:Tn*size);
output(2,:);
figure(10);
plot(output(2,:),'Linewidth',0.02,'-');
title('Signal 2 convolué');
xlabel('temps en secondes');
ylabel('Amplitude');

%figure(11)
%channel(output(2,:),Tn,0.7);





channel_effect = channel(output(2,:),10,0.7,10);
noise = 0.03*randn(1,columns(channel_effect));
figure(11)
plot(channel_effect+noise,'Linewidth',0.02,'r-',output(2,:),'Linewidth',0.02,'b-');

