clc;clear all;
global tr;global ta;global e;global f1;
tr=1;ta=1;e=1;
Fs=100;
N=200;
end_time=12;
output=[];outputf=[];output1=[];output2=[];output3=[];
output1d=[];output2d=[];output3d=[];
iniu1=1;iniu2=0;iniu3=1;
for tt=(0:N-1)/Fs
f1=0.5+3*sin(pi*tt)+2*sin(6*pi*tt)+0.4*sin(3*pi*tt)-sin(8*pi*tt);
outputf=[outputf,f1];
t = linspace(end_time-10,end_time,Fs);
x=[iniu1 iniu2 iniu3];
sol=ode45(@cpgwfun,[0 end_time],x);
y1 = deval(sol,t);
y11=y1(1,:);iniu1=mean(y11);
y12=y1(2,:);iniu2=mean(y12);
y13=y1(3,:);iniu3=mean(y13);
y1d=(1/tr)*(-iniu1-iniu2*iniu3+e*f1);
y2d=(1/ta)*(-iniu2+iniu3*iniu1);
y3d=sign(iniu1)*(e*f1*iniu2)/(sqrt(iniu1*iniu1+iniu2*iniu2));
output=[output,y3d];
output1=[output1 iniu1];
output2=[output2 iniu2];
output3=[output3 iniu3];
output1d=[output1d y1d];
output2d=[output2d y2d];
output3d=[output3d y3d];
end
figure();
plot((0:N-1)/Fs,outputf,'r',(0:N-1)/Fs,output,'b+','linewidth',3);
xlabel('Time');
ylabel('Amplitude');



