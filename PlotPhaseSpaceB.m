%Plot PhaseSpaceB.png

%Solve for membrane and threshold potentials, position of spikes and the internal spike-induced currents.
Iext=1.5*ones(1,0.5*10^5+1);
[V,theta,spikes,I1,I2]=ForwardEulerWithCurrents(0.005,10,-0.6,-70,-50,Iext);

%Plot trajectory
clf
hold on
J=1;
marker=1;
for I=1:7
    %Plot each section between spikes
    while V(J)~=spikes(I,2)
        J=J+1;
    end
    plot3(I1(marker:J),I2(marker:J),V(marker:J),'b')
    scatter3(I1(J),I2(J),spikes(I,2),8,'k','filled')
    marker=J+1;
    J=J+1;
end
%Plot final section
plot3(I1(marker:length(V)),I2(marker:length(V)),V(marker:length(V)),'b')
%Change view
view(-160.6,9.1)
%Add axis labels and save plot
xlabel('I1')
ylabel('I2')
zlabel('Membrane Potential')
saveas(gcf,'PhaseSpaceB.png')
