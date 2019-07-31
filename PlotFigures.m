%Plot all figures
clf
%1A
Iext=1.5*ones(1,20001);
[V,theta,spikes]=ForwardEuler(0, 0,0,-70,-50,Iext);
t=linspace(0,0.2,20001);
subplot(5,4,1); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,1); ylabel('Potential (mV)'), title('Tonic Spiking'), axis([0 0.2 -80 -40])

%1B
Iext=(1+10^-6)*ones(1,50001);
[V,theta,spikes]=ForwardEuler(0, 0,0,-70,-50,Iext);
t=linspace(0,0.5,50001);
subplot(5,4,2); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,2); title('Class 1'), axis([0 0.5 -80 -40])


%1C
Iext=2*ones(1,20001);
[V,theta,spikes]=ForwardEuler(0.005, 0,0,-70,-50,Iext);
t=linspace(0,0.2,20001);
subplot(5,4,3); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,3); title('Spike Frequency Adaptation')

%1D
Iext=1.5*ones(1,50001);
[V,theta,spikes]=ForwardEuler(0.005, 0,0,-70,-50,Iext);
t=linspace(0,0.5,50001);
subplot(5,4,4); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,4); title('Phasic Spiking')

%1E 1.5(0.1s), 0(0.5s), 0.5(0.1s), 1(0.1s), 1.5(0.1s), 0(0.1s)
Iext=zeros(1,100001);
for I=1:10000
    Iext(I)=1.5;
    Iext(6*10^4+I)=0.5;
    Iext(7*10^4+I)=1;
    Iext(8*10^4+I)=1.5;
end
[V,theta,spikes]=ForwardEuler(0.005, 0,0,-70,-50,Iext);
t=linspace(0,1,100001);
subplot(5,4,5); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,5); ylabel('Potential (mV)'), title('Accommodation')

%1F 1.5(0.02s), 0(0.18s), ?1.5(0.025s), 0(0.025s), 1.5(0.025s), 0(0.125s)
Iext=zeros(1,0.4*10^5+1);
for I=1:0.02*10^5
    Iext(I)=1.5;
end
for I=0.2*10^5:0.225*10^5
    Iext(I)=-1.5;
end
for I=0.25*10^5:0.275*10^5
    Iext(I)=1.5;
end
[V,theta,spikes]=ForwardEuler(0.005, 0,0,-70,-50,Iext);
t=linspace(0,0.4,40001);
subplot(5,4,6); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,6); title('Threshold Variability')

%1G 0(0.05s), ?3.5(0.756s), 0(0.194s)
Iext=zeros(1,1*10^5+1);
for I=0.05*10^5:0.806*10^5
    Iext(I)=-3.5;
end
[V,theta,spikes]=ForwardEuler(0.005, 0,0,-70,-50,Iext);
t=linspace(0,1,100001);
subplot(5,4,7); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,7); title('Rebound Spike')

%1H
Iext=2*(1+10^-6)*ones(1,0.3*10^5+1);
[V,theta,spikes]=ForwardEuler(0.005, 0,0,-30,-30,Iext);
t=linspace(0,0.3,30001);
subplot(5,4,8); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,8); title('Class 2')

%1I 1.5(0.02s), 0(0.01s), 1.5(0.02s), 0(0.25s), 1.5(0.02s), 0(0.02s) 1.5(0.02s), 0(0.04s)
Iext=zeros(1,0.4*10^5+1);
Iext(1:0.02*10^5)=1.5;
Iext(0.03*10^5:0.05*10^5)=1.5;
Iext(0.3*10^5:0.32*10^5)=1.5;
Iext(0.34*10^5:0.36*10^5)=1.5;
[V,theta,spikes]=ForwardEuler(0.005, 0,0,-70,-50,Iext);
t=linspace(0,0.4,40001);
subplot(5,4,9); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,9); ylabel('Potential (mV)'), title('Integrator')

%IJ 1.5(0.1s), 1.7(0.4s), 1.5(0.1s), 1.7(0.4s)
Iext=1.7*ones(1,1*10^5+1);
Iext(1:0.1*10^5)=1.5;
Iext(0.5*10^5:0.6*10^5)=1.5;
[V,theta,spikes]=ForwardEuler(0.005, 0,0,-70,-50,Iext);
t=linspace(0,1,100001);
subplot(5,4,10); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,10); title('Input Bistability')

%IK
Iext=-1*ones(1,0.4*10^5+1);
[V,theta,spikes]=ForwardEuler(0.030,0,0,-70,-50,Iext);
t=linspace(0,0.4,40001);
subplot(5,4,11); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,11); title('Hyperpolarization Induced Spiking')

%IL
Iext=-1*ones(1,0.4*10^5+1);
[V,theta,spikes]=ForwardEuler(0.030,10,-0.6,-70,-50,Iext);
t=linspace(0,0.4,40001);
subplot(5,4,12); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,12); title('Hyperpolarization Induced Bursting')

%IM
Iext=2*ones(1,0.5*10^5+1);
[V,theta,spikes]=ForwardEuler(0.005,10,-0.6,-70,-50,Iext);
t=linspace(0,0.5,50001);
subplot(5,4,13); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,13); ylabel('Potential (mV)'), title('Tonic Bursting')

%IN
Iext=1.5*ones(1,0.5*10^5+1);
[V,theta,spikes]=ForwardEuler(0.005,10,-0.6,-70,-50,Iext);
t=linspace(0,0.5,50001);
subplot(5,4,14); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,14); title('Phasic Bursting')

%I0 0(0.1s), ?3.5(0.5s), 0(0.4s)
Iext=zeros(1,1*10^5+1);
Iext(0.1*10^5:0.6*10^5)=-3.5;
[V,theta,spikes]=ForwardEuler(0.005,10,-0.6,-70,-50,Iext);
t=linspace(0,1,100001);
subplot(5,4,15); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,15); title('Rebound Burst')

%IP
Iext=2*ones(1,0.5*10^5+1);
[V,theta,spikes]=ForwardEuler(0.005,5,-0.3,-70,-50,Iext);
t=linspace(0,0.5,50001);
subplot(5,4,16); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,16); title('Mixed Mode')

%IQ 2(0.015s), 0(0.185s)
Iext=zeros(1,0.2*10^5+1);
Iext(1:0.015*10^5)=2;
[V,theta,spikes]=ForwardEuler(0.005,5,-0.3,-70,-50,Iext);
t=linspace(0,0.2,20001);
subplot(5,4,17); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,17); ylabel('Potential (mV)'), title('Afterpotentials')

%IR 5(0.01s), 0(0.09s), 5(0.01s), 0(0.09s)
Iext=zeros(1,0.2*10^5+1);
Iext(1:0.01*10^5)=5;
Iext(0.1*10^5:0.11*10^5)=5;
[V,theta,spikes]=ForwardEuler(0,8,-0.1,-70,-50,Iext);
t=linspace(0,0.2,20001);
subplot(5,4,18); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,18); title('Basal Bistability')

%IS 5(0.005s), 0(0.005s), 4(0.005s), 0(0.385s), 5(0.005s), 0(0.045s) 4(0.005s), 0(0.345s)
Iext=zeros(1,0.8*10^5+1);
Iext(1:0.005*10^5)=5;
Iext(0.01*10^5:0.015*10^5)=4;
Iext(0.4*10^5:0.405*10^5)=5;
Iext(0.45*10^5:0.455*10^5)=4;
[V,theta,spikes]=ForwardEuler(0.005,-3,0.5,-70,-50,Iext);
t=linspace(0,0.8,80001);
subplot(5,4,19); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,19); title('Preferred Frequency')

%IT 8(0.002s), 0(0.048s)
Iext=zeros(1,0.05*10^5+1);
Iext(1:0.002*10^5)=8;
[V,theta,spikes]=ForwardEuler(-0.080,0,0,-70,-50,Iext);
t=linspace(0,0.05,5001);
subplot(5,4,20); plot(t,V,t,theta), hold on, scatter(spikes(:,1),spikes(:,2),8,'k','filled')
subplot(5,4,20); title('Spike Latency')

saveas(gcf,'ExamplePlots.png')