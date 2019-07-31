# Makefile for Detorakis et al reproductions

all: ExamplePlots.png PhaseSpaceA.png PhaseSpaceB.png

ExamplePlots.png: PlotFigures.m ForwardEuler.m
	matlab -batch PlotFigures

PhaseSpaceA.png: ForwardEuler.m PlotPhaseSpaceA.m
	matlab -batch PlotPhaseSpaceA
	
PhaseSpaceB.png: ForwardEulerWithCurrents.m PlotPhaseSpaceB.m
	matlab -batch PlotPhaseSpaceB
