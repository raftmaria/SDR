clc;
clear all; close all;

sigSrc = comm.SDRRTLReceiver('0',...
      'CenterFrequency',169650.0e3,...
      'EnableTunerAGC',true,...
      'SampleRate',240000,...
      'SamplesPerFrame',1024,...
      'OutputDataType','single',...
      'FrequencyCorrection',0);

  a=zeros(4096,1024);
  for i=1:4096
  a(i,:)=sigSrc();
 end
 figure;
 plot(abs(fft(a()))); %samples per frame?
 figure; periodogram(a);
  
 % Fs=240000;
 % signal=a;
 % Ts = 1/Fs;
%L = 30/Ts;
%t=0:Ts:(L-1)*Ts;
%t=0:1/Ts:Ts;
%figure; plot(t,signal);
%signal = fft(signal);
%figure; plot(abs(signal));
%figure; pwelch(signal,[],[],[],Fs);

%f1=103.5e6;
%s=2*cos(2*pi*f1*t);
%s=fft(s);
%figure; plot(abs(s));
%signal = abs(signal(:,0)).*s;
%signal = signal(:,1)*s;
%figure; plot(signal);
%signal = iift(signal);
%figure; plot(t,signal);