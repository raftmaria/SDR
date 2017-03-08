clc;
clear all;

f1=10e3;
f2=4e3;
fs=20*f1;

data=[1,0,1,0,1,0,1,0,1,0];
out=zeros(1,length(data));
data_rate=1000; % bps

t1=0:1/fs:(fs/f1)*(f1/data_rate)*(1/fs)-(1/fs);
x1=sin(2*pi*f1*t1);
t2=0:1/fs:(fs/f2)*(f2/data_rate)*(1/fs)-(1/fs);
x2=sin(2*pi*f2*t2);

%%%%% Modulation %%%%%
fsk=[];
for i=1:length(data)
    fsk = [fsk (data(i)==1)*x1+ (data(i)==0)*x2];
end
%%%%%% Demodulation %%%%%%
for k= 1:length(data)
    a1=fsk((k-1)*(fs/data_rate)+1:k*(fs/data_rate)).*x1;
    a2=fsk((k-1)*(fs/data_rate)+1:k*(fs/data_rate)).*x2;
    y1=sum(a1);
    y2=sum(a2);
    if y1>y2
        out(k)=1;
    elseif y1<y2
        out(k)=0;
    end
end

plot(fsk)




