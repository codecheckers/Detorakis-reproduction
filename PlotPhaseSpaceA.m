%Plot PhaseSpaceA.png

%Solve for membrane and threshold potentials and spike positions.
Iext=1.5*ones(1,50001);
[V,theta,spikes]=ForwardEuler(0.005, 0,0,-70,-50,Iext);

%Plot phase portrait
clf
x=linspace(-72,-30,8);
y=linspace(-55,-30,8);
[X,Y]=meshgrid(x,y);
U=1.5-0.05*(X+70);
Vgrid=0.005*(X+70)-0.01*(Y+50);
quiver(X,Y,U,Vgrid,'Color',[.4 .4 .4])

%Plot the trajectory
hold on
J=1;
marker=1;
for I=1:5
    %Plot each section between spikes.
    while V(J)~=spikes(I,2)
        J=J+1;
    end
    plot(V(marker:J),theta(marker:J),'b')
    marker=J+1;
    J=J+1;
end
%Plot final section.
plot(V(marker:length(V)),theta(marker:length(V)),'b')

%Plot V=theta
t=linspace(-55,-30);
plot(t,t,'g--')

%Plot position of spikes
scatter(spikes(:,2),spikes(:,2),20,'k','filled')

%Plot stable node
plot(V(end),theta(end),'*','LineWidth',10,'Color',[.4 .4 .4])

%Add axes labels and save plot
axis([-72 -30 -55 -30])
xlabel('Membrane Potential')
ylabel('Threshold Potential')
saveas(gcf,'PhaseSpaceA.png')
