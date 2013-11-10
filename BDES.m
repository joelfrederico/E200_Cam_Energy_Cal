% function BDES
% 
% This program converts BDES to KMOD or KMOD to BDES for various
% magnets in the FFTB.
% 
% 6-8-2002 Original version
% 
type=menu('What do you want to do?','BDES to KMOD','KMOD to BDES');
name={'QN3A' 'QT1' 'QMIC' 'QC4' 'QC3' 'QC2' 'QX1' 'QC1' 'QP1A' 'QP1B' 'QP3B' 'QP4' 'QP5' 'QP6' 'QSP2' 'Spencer PM Quad'};
quad=menu('For Which Quadrupole?',name{1:16});
% Quads
L1=0.23046; % QP1A ETC
L2=0.2335; % QP6, QC3
L3=0.5; % QP33A-5
L4=.275; % QSP1/2
L5=1.013; % QC2
L6=0.155; % QX1
L7=0.56; % QC1
L8=5E-2; % 10cm long PM quad
l=[L1 L1 L1  L1  L2  L5 L6 L7 L1 L1 L3 L3 L3 L3 L2 L4]*2;
% Constants
E=20.35;
Brho=E/0.029979;
if type==1
    bdes=input(['Input BDES for ' name{quad} ': ']);
    KMOD=bdes/(Brho*l(quad));
    display(['At ' num2str(E) 'GeV, a BDES of ' num2str(bdes) ' [kG] corresponds to a KMOD of ' num2str(KMOD) ' [1/m^-2] in ' name{quad}]);
else
    KMOD=input(['Input KMOD for ' name{quad} ': ']);
    bdes=KMOD*Brho*l(quad);
    display(['At ' num2str(E) 'GeV, a KMOD of ' num2str(KMOD) ' [1/m^-2] corresponds to a BDES of ' num2str(bdes) ' [kG] in ' name{quad}]);
end
